package com.wangyu.webtest.model;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class User {

    private int id;

    @NotBlank(message = "名字不能为空")
    private String name;

    @NotNull(message = "年龄不能为空")
    private int age;

}
