package com.earthball.admin.product.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.earthball.admin.product.model.vo.Product;
import com.earthball.common.template.ChangeFileName;

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

}
