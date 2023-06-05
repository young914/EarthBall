package com.kh.earthball.bo.product.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.earthball.bo.product.service.AdminProductService;
import com.kh.earthball.bo.product.vo.AdminAtta;
import com.kh.earthball.bo.product.vo.AdminProduct;
import com.kh.earthball.fo.common.template.ChangeFileName;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.product.vo.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class AdminProductController {

  private final AdminProductService productService;


  @GetMapping("adminlist.pro")
  public ModelAndView adminProductList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
                                 ModelAndView mv) {

    int listCount = productService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<AdminProduct> list = productService.adminAllProductList(pi);

    mv.addObject("pi", pi).addObject("list", list).setViewName("bo/product/productList");
    return mv;
  }

  @GetMapping("adminEnrollForm.pro")
  public String enrollForm() {
    return "bo/product/productEnrollForm";
  }


  @RequestMapping("insert.pro")
  public String insertProduct(AdminProduct p,
                            MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4, MultipartFile upfile5,
                            MultipartFile upfile6, MultipartFile upfile7, MultipartFile upfile8, MultipartFile upfile9, MultipartFile upfile10,
                            HttpSession session,
                            ModelAndView mv) {


    ArrayList<MultipartFile> fileList = new ArrayList<>();
    fileList.add(upfile1);
    fileList.add(upfile2);
    fileList.add(upfile3);
    fileList.add(upfile4);
    fileList.add(upfile5);
    fileList.add(upfile6);
    fileList.add(upfile7);
    fileList.add(upfile8);
    fileList.add(upfile9);
    fileList.add(upfile10);

    ArrayList<AdminAtta> list = new ArrayList<>();

    for(int i = 0; i < fileList.size(); i++) {
      MultipartFile file = fileList.get(i);

      if(!file.isEmpty()) {
        String changerName = ChangeFileName.saveFile(file, session);

        AdminAtta at = new AdminAtta();
        at.setChangerName(changerName);
        at.setFileLevel(i);

        list.add(at);
      }
    }


    int result = productService.insertProduct(p,list);

    if(result>0) {
      session.setAttribute("alertMsg", "상품추가 성공");
      return "redirect:/adminEnrollForm.pro";
    }else {
      session.setAttribute("alertMsg", "상품추가 실패");
      return "redirect:/adminEnrollForm.pro";
    }
  }

}