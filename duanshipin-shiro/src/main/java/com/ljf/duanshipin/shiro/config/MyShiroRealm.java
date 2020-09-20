package com.ljf.duanshipin.shiro.config;

import com.ljf.duanshipin.domain.Admin;
import com.ljf.duanshipin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/9/18 15:52
 */
@Slf4j
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private AdminService adminService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        UserInfo userInfo  = (UserInfo)principals.getPrimaryPrincipal();
//        for(SysRole role:userInfo.getRoleList()){
//            authorizationInfo.addRole(role.getRole());
//            for(SysPermission p:role.getPermissions()){
//                authorizationInfo.addStringPermission(p.getPermission());
//            }
//        }
        return authorizationInfo;
    }

    /*主要是用来进行身份认证的，也就是说验证用户输入的账号和密码是否正确。*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
            throws AuthenticationException {
        System.out.println("MyShiroRealm.doGetAuthenticationInfo()");
//        //获取用户的输入的账号.
        String username = (String)token.getPrincipal();
        String password = new String((char[]) token.getCredentials());

        log.info("doGetAuthenticationInfo："+username);
        //通过username从数据库中查找 User对象，如果找到，没找到.
        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        Admin userInfo = (Admin) adminService.findByUsername(username);
        log.info("doGetAuthenticationInfo："+userInfo.toString());

        if (!StringUtils.equals(password, userInfo.getPassword())) {
            throw new IncorrectCredentialsException("用户名或密码错误！");
        }else if (userInfo.getStatus() != 1) {
            throw new LockedAccountException("账号已被锁定,请联系管理员！");
        }

        return new SimpleAuthenticationInfo(userInfo, password, getName());
    }

}
