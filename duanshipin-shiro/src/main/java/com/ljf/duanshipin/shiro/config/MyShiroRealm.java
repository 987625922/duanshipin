package com.ljf.duanshipin.shiro.config;

import com.ljf.duanshipin.common.utils.Md5Util;
import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.domain.Permission;
import com.ljf.duanshipin.domain.Role;
import com.ljf.duanshipin.mapper.PermissionMapper;
import com.ljf.duanshipin.mapper.RoleMapper;
import com.ljf.duanshipin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 15:52
 */
@Slf4j
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private AdminService adminService;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Role role = roleMapper.findById(admin.getRoleId());
        List<Permission> permissionList = permissionMapper.findByPermissionListByRoleId(role.getId());
        Set<String> roleSet = new HashSet<>();
        roleSet.add(role.getRole());
        authorizationInfo.setRoles(roleSet);
        Set<String> permissionSet = permissionList.stream().map(Permission::getUrl).collect(Collectors.toSet());
        authorizationInfo.setStringPermissions(permissionSet);
        return authorizationInfo;
    }

    /**
     * 主要是用来进行身份认证的，也就是说验证用户输入的账号和密码是否正确。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
            throws AuthenticationException {
//        //获取用户的输入的账号.
        String account = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());

        //通过username从数据库中查找 User对象，如果找到，没找到.
        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        Admin userInfo = (Admin) adminService.findAdminByAccount(account);

        password = Md5Util.encrypt(account, password);

        if (!StringUtils.equals(password, userInfo.getPassword())) {
            throw new IncorrectCredentialsException("用户名或密码错误！");
        } else if (userInfo.getStatus() != 1) {
            throw new LockedAccountException("账号已被锁定,请联系管理员！");
        }

        return new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(), getName());
//        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
//                userInfo, //用户名
//                userInfo.getPassword(), //密码
//                ByteSource.Util.bytes(userInfo.getAccount()),
//                getName()  //realm name
//        );
//        return authenticationInfo;
    }

}
