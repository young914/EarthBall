package com.earthball.admin.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.Controller")
public class ProductController {

  @RequestMapping("adminProductListView")
  public String adminProductList() {
    return "admin/product/productList";
  }

  @RequestMapping("enrollForm.pro")
  public String enrollForm() {
    return "admin/product/productEnrollForm";
  }

}
