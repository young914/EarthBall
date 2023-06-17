package com.kh.earthball.bo.product.controller;

import java.io.File;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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


  @PostMapping("insert.pro")
  public String insertProduct(AdminProduct p, ArrayList<MultipartFile> upfiles, HttpSession session) {

    ArrayList<AdminAtta> list = new ArrayList<AdminAtta>();

    for(int i = 0; i < upfiles.size(); i++){
      MultipartFile file = upfiles.get(i);

      if(!file.isEmpty()){
        String changerName = ChangeFileName.saveFile(file, session);

        AdminAtta at = new AdminAtta();
        at.setChangerName(changerName);
        at.setFileLevel(i);

        list.add(at);
      }
    }

    int result = productService.insertProduct(p, list);

    if(result > 0) {
      session.setAttribute("alertMsg", "상품 등록 성공");
      return "redirect:adminlist.pro";
    }else {
      session.setAttribute("alertMsg", "상품 등록 실패");
      return "redirect:adminEnrollForm.pro";
    }
  }


  @GetMapping("adminDetailView.pro")
  public String selectDetailView(int productNo, Model model) {
    AdminProduct p = productService.selectDetailView(productNo);
    ArrayList<AdminAtta> list = productService.selectDetailviewAtta(productNo);


    model.addAttribute("p", p);
    model.addAttribute("list", list);

    return "bo/product/productDetailView";
  }

  @RequestMapping("update.pro")
  public String updateProduct(AdminProduct p,
                            MultipartFile[] upfiles,
                            String[] changeNames,
                            HttpSession session,
                            ModelAndView mv) {

    ArrayList<AdminAtta> list = new ArrayList<>();


    for(int i = 0; i < 10; i++){

      AdminAtta at = new AdminAtta();

      if(!upfiles[i].isEmpty()){

        String realPath = session.getServletContext().getRealPath("resources/fo/upfiles/" + changeNames[i]);

        System.out.println(realPath);

        new File(realPath).delete();

        String changeName = ChangeFileName.saveFile(upfiles[i], session);

        at.setChangerName(changeName);
        at.setFileLevel(i);
        at.setProductNo(p.getProductNo());

      }else{

        at.setChangerName(changeNames[i]);
        at.setFileLevel(i);
        at.setProductNo(p.getProductNo());
      }

      list.add(at);

    }

    System.out.println(list.get(0));
    System.out.println(list.get(1));
    System.out.println(list.get(2));
    System.out.println(list.get(3));
    System.out.println(list.get(4));
    System.out.println(list.get(5));
    System.out.println(list.get(6));
    System.out.println(list.get(7));
    System.out.println(list.get(8));
    System.out.println(list.get(9));

    int result = productService.updateProduct(p, list);

    if(result>0) {
      session.setAttribute("alertMsg", "상품 수정 성공");
      return "redirect:adminlist.pro";
    }else{
      session.setAttribute("alertMsg", "상품 수정 실패");
      return "redirect:adminDetailView.pro?productNo="+p.getProductNo();
    }
  }

}