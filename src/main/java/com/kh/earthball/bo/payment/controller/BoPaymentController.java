package com.kh.earthball.bo.payment.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.earthball.bo.payment.service.BoPaymentService;
import com.kh.earthball.bo.payment.vo.BoPayInfo;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class BoPaymentController {

  private final BoPaymentService boPaymentService;

  @GetMapping("/list.cpa")
  public String cancelPayList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {

    // 모든 취소 요청 수 조회
    int listCount = boPaymentService.cancelPayListCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 모든 취소 요청 리스트 조회
    List<BoPayInfo> boCancelPayList = boPaymentService.selectCancelPayList(pageInfo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("cancelList",  boCancelPayList);

    System.out.println(boCancelPayList);

    return "bo/payment/cancelPayListView";
  }

}
