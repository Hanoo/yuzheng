package com.css.entity;

public class YuzhengUser {
    private String id;

    private String userName;

    private String userPassword;

    private String displayName;

    private String prisonArea;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName == null ? null : displayName.trim();
    }

    public String getPrisonArea() {
        return prisonArea;
    }

    public void setPrisonArea(String prisonArea) {
        this.prisonArea = prisonArea == null ? null : prisonArea.trim();
    }
}