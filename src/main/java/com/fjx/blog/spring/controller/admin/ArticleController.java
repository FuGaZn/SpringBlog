package com.fjx.blog.spring.controller.admin;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.service.ArticleService;
import com.fjx.blog.spring.utils.ObjectConvert;
import com.fjx.blog.spring.vo.ArticleVO;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ArticleController {
 //   @Autowired
  //  ArticleService articleService;

    @RequestMapping(value = "/admin/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(HttpServletRequest request, HttpServletResponse response,
                                 @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        JSONObject jsonObject=new JSONObject();

        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession().getServletContext().getRealPath("/resource/img");

            System.out.println("editormd上传图片："+rootPath);

            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath = new File(rootPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }

            // 最终文件名
            File realFile = new File(rootPath + File.separator + attach.getOriginalFilename());
            Files.copy(attach.getInputStream(),realFile.toPath());
            //FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

            // 下面response返回的json格式是editor.md所限制的，规范输出就OK

            jsonObject.put("success", 1);
            jsonObject.put("message", "上传成功");
            jsonObject.put("url", "/resource/img/"+attach.getOriginalFilename());
        } catch (Exception e) {
            jsonObject.put("success", 0);
        }

        return jsonObject.toString();
    }

    @RequestMapping(value = "/admin/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveArticle(ArticleVO obj){
        System.out.println("================article");
        System.out.println(obj.getStatus());
        Article article = ObjectConvert.convertVO(obj);
        article.setPublishTime(new Date());
   //     articleService.saveArticle(article);
        Map<String,Object> map = new HashMap();
        map.put("1","success");
        return new JSONObject(map).toString();
    }
}
