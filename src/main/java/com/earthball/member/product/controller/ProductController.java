package com.earthball.member.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

  @RequestMapping("list.pro")
  public String productList() {
    return "/member/product/productList";
  }

}
