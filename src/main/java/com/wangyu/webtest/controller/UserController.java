package com.wangyu.webtest.controller;

import com.wangyu.webtest.model.User;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @GetMapping(value = "/say")
    @ResponseBody
    public String say(@RequestParam(value="name") String name) {
        return "hello " + name + ", Success!!!";
    }


    @PostMapping(value = "/addUser")
    @ResponseBody
    public String addUser(@Valid @RequestBody User user) {
        return "hello " + user.getName() + "!!!";
    }


}
