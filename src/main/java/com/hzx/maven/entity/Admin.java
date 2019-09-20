package com.hzx.maven.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Admin {
    private Integer id;

    private String adUsername;

    private String adPass;

    private Date adZctime;
}