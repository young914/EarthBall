package com.kh.earthball.fo.diary.controller;

import com.kh.earthball.fo.diary.service.DiaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DiaryController {

  @Autowired
  private DiaryService diaryService;

  @RequestMapping("diary.bo")
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage) {

    // System.out.println("cPage : " + currentPage);

    // 페이징 처리를 위한 PageInfo 객체 얻어내기
    int listCount = diaryService.selectListCount();


    // 포워딩 테스트
    return "member/diary/diaryListView";

  }


  @RequestMapping("upload")
  public void uploadMethod() {
    System.out.println("제발");
  }


  @RequestMapping("")
  public String diaryEnrollForm() {
    return "member/diary/diaryEnrollForm";
  }


}
