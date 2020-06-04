package com.springbootjsp.pojo;

import java.util.Date;

public class Files {

    private Integer id;

    private String name;//文件名称

    private String content;//文件描述

    private String files;//文件路径

    private String remark;//文件备注

    private Date createDate;//创建时间

    private Date updateDate;//更新时间

    private Integer status;//公开状态

    private Integer uid;//上传文件用户id

    private Integer isDelete;//是否删除文件


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
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


    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getStatus() {
        return status;
    }


    public void setStatus(Integer status) {
        this.status = status;
    }


    public Integer getIsDelete() {
        return isDelete;
    }


    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}