package com.springbootjsp.pojo;

import java.util.Date;

public class FilesVersion {

    private Integer id;//编号

    private Integer fid;//文件id

    private String code;//版本号

    private String name;//文件名称

    private String content;//文件描述

    private String files;//文件路径

    private String remark;//文件备注

    private Date createDate;//创建日期

    private String msg;//版本信息

    private Integer isDelete;//是否删除

    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }


    public String getCode() {
        return code;
    }


    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }


    public String getContent() {
        return content;
    }


    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }


    public String getFiles() {
        return files;
    }


    public void setFiles(String files) {
        this.files = files == null ? null : files.trim();
    }


    public String getRemark() {
        return remark;
    }


    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }


    public Date getCreateDate() {
        return createDate;
    }


    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public String getMsg() {
        return msg;
    }


    public void setMsg(String msg) {
        this.msg = msg == null ? null : msg.trim();
    }


    public Integer getIsDelete() {
        return isDelete;
    }


    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}