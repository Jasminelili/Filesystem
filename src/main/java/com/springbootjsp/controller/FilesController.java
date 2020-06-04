package com.springbootjsp.controller;

import com.alibaba.fastjson.JSON;
import com.springbootjsp.dto.FilesDto;
import com.springbootjsp.pojo.Files;
import com.springbootjsp.pojo.FilesVersion;
import com.springbootjsp.pojo.User;
import com.springbootjsp.service.impl.FilesService;
import com.springbootjsp.service.impl.FilesVersionService;
import com.springbootjsp.utils.FileDownload;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@RestController
public class FilesController {

    @Value("${files.uploadPath}")
    private String uploadPath;

    @Autowired
    FilesService filesService;

    @Autowired
    FilesVersionService filesVersionService;

    @RequestMapping("/myFiles/uploadFilesView")
    public ModelAndView uploadFilesView(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("views/myFiles/uploadFiles");
        return mv;
    }

    @RequestMapping("/myFiles/myFilesListView")
    public ModelAndView myFilesListView(HttpSession session){
        ModelAndView mv = new ModelAndView();

        User user = (User) session.getAttribute("user");
        List<Files> list = filesService.list(user.getId(),null);
        mv.addObject("list",list);
        mv.setViewName("views/myFiles/list");
        return mv;
    }
   //公共文件
    @RequestMapping("/commonFiles/commonFilesListView")
    public ModelAndView publicFilesListView(HttpSession session,@RequestParam(value = "keyword",required = false) String keyword){
        ModelAndView mv = new ModelAndView();
        List<FilesDto> list =  filesService.findPublicFiles(keyword);

        mv.addObject("list",list);
        mv.addObject("keyword",keyword);
        mv.setViewName("views/commonFile/list");
        return mv;
    }

    @RequestMapping("/myFiles/pushFilesView")
    public ModelAndView pushFilesView(Integer id){
        ModelAndView mv = new ModelAndView();
        Files files = filesService.find(id);
        mv.addObject("files",files);
        mv.setViewName("views/myFiles/uploadFiles");
        return mv;
    }

    @RequestMapping("/myFiles/editFilesView")
    public ModelAndView editFilesView(Integer id){
        ModelAndView mv = new ModelAndView();
        Files files = filesService.find(id);
        mv.addObject("files",files);
        mv.setViewName("views/myFiles/editFiles");
        return mv;
    }

    @RequestMapping("/files/deleteFiles")
    @ResponseBody
    public String deleteFiles(Integer id){
        Files files = filesService.find(id);
        files.setIsDelete(1);
        filesService.edit(files);
        return JSON.toJSONString(true);
    }

    @RequestMapping("/files/changeFilesStatus")
    @ResponseBody
    public String changeFilesStatus(Integer id,Integer status){
        Files files = filesService.find(id);
        files.setStatus(status);
        filesService.edit(files);
        return JSON.toJSONString(true);
    }

    @RequestMapping("/myFiles/uploadFiles")
    public ModelAndView uploadFiles(HttpSession session,Files files, @RequestParam(name = "file") MultipartFile file){
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("user");
        try{
            if (file != null){
               // System.out.println(file.getOriginalFilename());
               //String suffixName = file.getOriginalFilename().split("\\.")[1];
                //System.out.println(suffixName);
                //String filename =System.currentTimeMillis()+"." + suffixName;
                String filename=System.currentTimeMillis()+"-"+file.getOriginalFilename();
                //查看文件夹存不存在
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String filepath = uploadPath + filename;
                File serverFile = new File(filepath);
                //保存文件
                //使用此方法保存必须要绝对路径且文件夹必须已存在,否则报错
                file.transferTo(serverFile);
                files.setFiles(filename);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        files.setUid(user.getId());
        filesService.insert(files);
        FilesVersion fileVersion = new FilesVersion();

        BeanUtils.copyProperties(files, fileVersion);
        //以当前时间做版本号
        fileVersion.setCode(System.currentTimeMillis()+"");
        fileVersion.setMsg("初创版本");
        fileVersion.setFid(files.getId());
        filesVersionService.insert(fileVersion);

        mv.setViewName("redirect:/myFiles/myFilesListView");
        return mv;
    }

    @RequestMapping("/myFiles/pushFilesVersion")
    public ModelAndView pushFilesVersion(Files files, @RequestParam(name = "file",required = false) MultipartFile file){
        ModelAndView mv = new ModelAndView();

        try{
            if (file != null){
//                String suffixName = file.getOriginalFilename().split("\\.")[1];
//                String filename =System.currentTimeMillis()+"." + suffixName;
                String filename=System.currentTimeMillis()+"-"+file.getOriginalFilename();
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String filepath = uploadPath + filename;
                File serverFile = new File(filepath);
                file.transferTo(serverFile);
                files.setFiles(filename);
            }

            filesService.edit(files);
            FilesVersion fileVersion = new FilesVersion();
            BeanUtils.copyProperties(files, fileVersion);
            fileVersion.setCode(System.currentTimeMillis()+"");
            fileVersion.setMsg("更新版本");
            fileVersion.setId(null);
            fileVersion.setFid(files.getId());
            filesVersionService.insert(fileVersion);

        }catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("redirect:/filesVersion/ListView?fid="+files.getId());
        return mv;
    }

    @RequestMapping("/files/downloadFiles")
    public void downloadFiles(Integer fid, HttpServletResponse response)throws Exception{
        Files files = filesService.find(fid);
        String fileName = files.getFiles();
        FileDownload.fileDownload(response, uploadPath+fileName, fileName);
    }

}
