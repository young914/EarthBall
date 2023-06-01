package com.kh.earthball.bo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

  @RequestMapping("admin")
  public String productList() {
    return "/admin/adminPage";
  }

}
