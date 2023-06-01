package com.earthball.member.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {

      @RequestMapping("upload")
      public void uploadMethod() {
          System.out.println("제발");
      }



  @RequestMapping("diary.bo")
  public String diaryEnrollForm() {
    return "member/diary/diaryEnrollForm";
  }




}
