package com.kh.earthball.fo.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.earthball.fo.diary.service.DiaryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class DiaryController {


  private final DiaryService diaryService;

  @RequestMapping("diaryListView.bo")
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage) {

    // System.out.println("cPage : " + currentPage);

    // 페이징 처리를 위한 PageInfo 객체 얻어내기
    int listCount = diaryService.selectListCount();


    // 포워딩 테스트
    return "fo/diary/diaryListView";

  }


  @RequestMapping("upload")
  public void uploadMethod() {
    System.out.println("제발");
  }


  @RequestMapping("diaryEnrollForm.bo")
  public String diaryEnrollForm() {
    return "fo/diary/diaryEnrollForm";
  }


}
