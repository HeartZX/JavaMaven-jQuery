package com.hzx.maven.entity;

public class AdminKey {
    private String adUsername;

    private Integer id;

    public String getAdUsername() {
        return adUsername;
    }

    public void setAdUsername(String adUsername) {
        this.adUsername = adUsername == null ? null : adUsername.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}