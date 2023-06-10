package com.kh.earthball.fo.product.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.kh.earthball.fo.common.template.ChangeFileName;
import com.kh.earthball.fo.product.service.ReviewService;
import com.kh.earthball.fo.product.vo.Review;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {

  private final ReviewService reviewService;

  @PostMapping(value="insert.review")
  public String ajaxInsertReview(@RequestParam("productNo") int productNo,
                             @RequestParam("memberId") String memberId,
                             @RequestParam("reviewContent") String reviewContent,
                             @RequestParam("reviewScore") int reviewScore,
                             @RequestParam("upfile") MultipartFile upfile,
                             HttpSession session,
                             Model model) {
    System.out.println(productNo);
    System.out.println(memberId);
    System.out.println(reviewContent);
    System.out.println(upfile);

    String changeName = null;


    if(!upfile.isEmpty()) {
      changeName = ChangeFileName.saveFile(upfile, session);
    }

    Review r = new Review();
    r.setProductNo(productNo);
    r.setMemberId(memberId);
    r.setReviewContent(reviewContent);
    r.setRating(reviewScore);
    r.setChangeName(changeName);

    int result = reviewService.insertReview(r);
    if(result>0) {
      model.addAttribute("success");
    }else {
      model.addAttribute("fail");
    }

    return "fo/product/productDetailView";
  }

}
