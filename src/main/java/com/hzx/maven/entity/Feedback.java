package com.hzx.maven.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Feedback {
    private Integer id;

    private Integer rdId;

    private String fbTitle;

    private String fbText;

    private Date fbTime;
}