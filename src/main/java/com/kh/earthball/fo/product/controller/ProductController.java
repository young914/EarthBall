package com.kh.earthball.fo.product.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.service.LikeService;
import com.kh.earthball.fo.member.vo.Member;
import com.kh.earthball.fo.product.service.ProductService;
import com.kh.earthball.fo.product.service.ReviewService;
import com.kh.earthball.fo.product.vo.Atta;
import com.kh.earthball.fo.product.vo.Product;
import com.kh.earthball.fo.product.vo.Review;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ProductController {

  private final ProductService productService;
  private final ReviewService reviewService;
  private final LikeService likeService;

  @RequestMapping("list.pro")
  public String productList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {

    int listCount = productService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Product> list = productService.selectAllProduct(pi);

    model.addAttribute("list", list);
    return "/fo/product/productList";
  }

  @RequestMapping("categoryList.pro")
  public String categoryList(@RequestParam(value="cPage", defaultValue="1") int currentPage, String category, Model model) {

    int listCount = productService.selectCategoryListCount(category);
    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Product> list = productService.selectCategoryProduct(pi, category);

    model.addAttribute("list", list);
    model.addAttribute("pi", pi);
    return "/fo/product/productList";
  }

  @RequestMapping("detailView.pro")
  public String productDetailView(int productNo, Model model, HttpSession session) {

    Product p = productService.selectProduct(productNo);
    ArrayList<Atta> list = productService.selectAtta(productNo);

    // 좋아요 여부 조회
    if(session.getAttribute("loginUser") != null) {
      String memberId = ((Member)(session.getAttribute("loginUser"))).getMemberId();

      int count = 0;
      count = likeService.likeStatus(memberId, productNo);

      if(count == 1) {
        model.addAttribute("likeStatus", true);
      } else {
        model.addAttribute("likeStatus", false);
      }
    }

    // 구매평 조회
    ArrayList<Review> rlist = reviewService.selectList(productNo);


    model.addAttribute("p", p);
    model.addAttribute("list", list);
    model.addAttribute("rlist", rlist);
    return "/fo/product/productDetailView";
  }

}
