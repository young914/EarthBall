package com.kh.earthball.fo.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.Controller")
public class ProductController {

  @RequestMapping("list.pro")
  public String productList() {
    return "/fo/product/productList";
  }

}
