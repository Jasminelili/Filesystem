package com.springbootjsp.controller;

import com.alibaba.fastjson.JSON;
import com.springbootjsp.pojo.Files;
import com.springbootjsp.pojo.FilesVersion;
import com.springbootjsp.pojo.User;
import com.springbootjsp.service.impl.FilesService;
import com.springbootjsp.service.impl.FilesVersionService;
import com.springbootjsp.utils.FileDownload;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;


@RestController
public class FilesVersionController {

    @Value("${files.uploadPath}")
    private String uploadPath;

    @Autowired
    FilesService filesService;

    @Autowired
    FilesVersionService filesVersionService;

    @RequestMapping("/filesVersion/ListView")
    public ModelAndView filesVersionListView(Integer fid){
        ModelAndView mv = new ModelAndView();
        List<FilesVersion> list = filesVersionService.list(fid);
        mv.addObject("list",list);
        mv.setViewName("views/filesVersion/list");
        return mv;
    }

    @RequestMapping("/filesVersion/pushVersionView")
    public ModelAndView pushVersionView(Integer fid){
        ModelAndView mv = new ModelAndView();
        Files files = filesService.find(fid);
        mv.addObject("data",files);
        mv.setViewName("views/filesVersion/pushVersion");
        return mv;
    }

    @RequestMapping("/filesVersion/deleteVersion")
    @ResponseBody
    public String deleteVersion(Integer id){
        FilesVersion filesVersion = filesVersionService.find(id);
        filesVersion.setIsDelete(1);
        filesVersionService.edit(filesVersion);
        return JSON.toJSONString(true);
    }

    @RequestMapping("/filesVersion/backVersion")
    @ResponseBody
    public String backVersion(Integer id){
        FilesVersion filesVersion = filesVersionService.find(id);
        filesVersion.setId(null);
        filesVersion.setMsg("回退版本");
        filesVersion.setCode(System.currentTimeMillis()+"");
        filesVersionService.insert(filesVersion);

        Files files = filesService.find(filesVersion.getFid());
        files.setName(filesVersion.getName());
        files.setContent(filesVersion.getContent());
        files.setFiles(filesVersion.getFiles());
        files.setRemark(filesVersion.getRemark());
        filesService.edit(files);
        return JSON.toJSONString(true);
    }


    @RequestMapping("/files/downloadFilesVersion")
    public void downloadFiles(Integer vid, HttpServletResponse response)throws Exception{
        FilesVersion filesVersion = filesVersionService.find(vid);
        String fileName = filesVersion.getFiles();
        FileDownload.fileDownload(response, uploadPath +fileName, fileName);
    }
}
