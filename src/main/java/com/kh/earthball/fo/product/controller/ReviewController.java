package com.kh.earthball.fo.product.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.kh.earthball.fo.common.template.ChangeFileName;
import com.kh.earthball.fo.product.service.ReviewService;
import com.kh.earthball.fo.product.vo.Review;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {

  private final ReviewService reviewService;

  @ResponseBody
  @PostMapping(value="insert.review")
  public String ajaxInsertReview(@RequestParam("productNo") int productNo,
                             @RequestParam("memberId") String memberId,
                             @RequestParam("reviewContent") String reviewContent,
                             @RequestParam("reviewScore") int reviewScore,
                             @RequestParam(value="upfile", required = false) MultipartFile upfile,
                             HttpSession session) {
    System.out.println(productNo);
    System.out.println(memberId);
    System.out.println(reviewContent);
    System.out.println(reviewScore);
    System.out.println(upfile);

    String changeName = null;


    if(upfile != null) {
      changeName = ChangeFileName.saveFile(upfile, session);
    }

    Review r = new Review();
    r.setProductNo(productNo);
    r.setMemberId(memberId);
    r.setReviewContent(reviewContent);
    r.setRating(reviewScore);
    r.setChangeName(changeName);

    System.out.println(r);

    int result = reviewService.insertReview(r);

    System.out.println(result);

    return new Gson().toJson(result);
  }

  @ResponseBody
  @GetMapping(value="list.review", produces="application/json; charset=UTF-8")
  public String selectListReview(int productNo) {

    ArrayList<Review> list = reviewService.selectList(productNo);

    return new Gson().toJson(list);
  }

  @ResponseBody
  @GetMapping(value="only.photo", produces="application/json; charset=UTF-8")
  public String selectListPhotoReview(int productNo) {

    ArrayList<Review> list = reviewService.selectPhotoList(productNo);

    return new Gson().toJson(list);
  }

  @ResponseBody
  @GetMapping(value="insert.reply", produces="application/json; charset=UTF-8")
  public String insertReply(int reviewNo, String replyContent, String memberId) {

    Review r = new Review();

    r.setReviewNo(reviewNo);
    r.setReplyContent(replyContent);
    r.setMemberId(memberId);

    int result = reviewService.insertReply(r);

    if(result > 0) {
      result = reviewService.updateReviewCount(reviewNo);
    }

    return new Gson().toJson(result);
  }

  @ResponseBody
  @GetMapping(value="list.reply", produces="application/json; charset=UTF-8")
  public String selectReplyList(int reviewNo) {

    ArrayList<Review> list = reviewService.selectReplyList(reviewNo);

    return new Gson().toJson(list);
  }

}
