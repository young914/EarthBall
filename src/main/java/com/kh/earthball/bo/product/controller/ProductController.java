package com.kh.earthball.bo.product.controller;

import com.kh.earthball.bo.product.vo.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller("admin.Controller")
public class ProductController {

  @RequestMapping("adminProductListView")
  public String adminProductList() {
    return "bo/product/productList";
  }

  @RequestMapping("enrollForm.pro")
  public String enrollForm() {
    return "bo/product/productEnrollForm";
  }

  @RequestMapping("insert.pro")
  public void insertProduct(Product p,
                            MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4,
                            HttpSession session) {

    System.out.println(upfile1);

    String changeName1 = null;
    String changeName2 = null;
    String changeName3 = null;
    String changeName4 = null;

//    if(!upfile1.getOriginalFilename().equals("")) {
//      changeName1 = ChangeFileName.saveFile(upfile1, session);
//      changeName2 = ChangeFileName.saveFile(upfile2, session);
//      changeName3 = ChangeFileName.saveFile(upfile2, session);
//      changeName4 = ChangeFileName.saveFile(upfile2, session);
  }


}