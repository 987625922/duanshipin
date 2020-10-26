package com.ljf.duanshipin.controller;

import com.ljf.duanshipin.common.dto.JsonResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author: LL
 * @Description:
 * @Date:Create：in 2020/10/23 17:41
 */
@Controller
@RequestMapping("/api/file")
@PropertySource({"classpath:resource.properties"})
public class FileController {

    @Value("${web.file.path}")
    private String filePath;

    @RequestMapping("/upload")
    @ResponseBody
    public Object upload(@RequestParam("cover") MultipartFile file,
                         HttpServletRequest request) {
        String name = request.getParameter("name");
        System.out.println("用户名：" + name);
        //获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        System.out.println("配置文件注入的文件路径为" + filePath);
        //获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        System.out.println("上传的后缀名为：" + suffixName);
        //文件上传后的路径
        fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        try {
            file.transferTo(dest);
            return JsonResult.buildSuccess(fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return JsonResult.buildError("上传失败", -1);
    }

}
