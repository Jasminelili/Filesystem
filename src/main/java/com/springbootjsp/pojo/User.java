package com.springbootjsp.pojo;

public class User {

    private Integer id;//用户id

    private String username;//用户名

    private String password;//密码

    private String code;//用户编号

    private String name;//姓名

    private String sex;//性别

    private String mobile;//电话

    private Integer role;//权限 1：志愿者  2：团

    private Integer isDelete;//是否删除

    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
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


    public String getSex() {
        return sex;
    }


    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }


    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }


    public Integer getRole() {
        return role;
    }


    public void setRole(Integer role) {
        this.role = role;
    }


    public Integer getIsDelete() {
        return isDelete;
    }


    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}