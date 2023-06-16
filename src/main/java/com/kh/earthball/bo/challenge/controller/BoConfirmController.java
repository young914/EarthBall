package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.BoConfirmService;
import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
public class BoConfirmController {

  private final BoConfirmService boConfirmService;

  @GetMapping("/list.conf")
  public String confirmList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {

    // 모든 챌린지 게시글 수 조회
    int listCount = boConfirmService.ConfirmListCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 모든 챌린지 게시글 리스트 조회
    List<BoConfirm> confirmList = boConfirmService.selectConfirmList(pageInfo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("confirmList", confirmList);

    return "bo/challenge/challengeEdit/confirmListView";
  }

  @GetMapping("/detail.conf")
  public String confirmDetailView(int chConNo) {

    return "bo/challenge/challengeEdit/confirmDetailView";
  }

}
