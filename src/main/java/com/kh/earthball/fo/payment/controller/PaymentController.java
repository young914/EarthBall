package com.kh.earthball.fo.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.fo.payment.service.PaymentService;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class PaymentController {

  private final PaymentService paymentService;

  @PostMapping("payment.pa")
  public void paymentPageForm(PayPageList ppl, int totalPrice, Model model) {

    System.out.println("orders : " + ppl.getOrders());
    System.out.println("totalPrice : " + totalPrice);

    // return "fo/payment/paymentPageForm";
  }

  @PostMapping("payComplete.pa")
  public String paymentCompleteView(String paymentNo, Model m) {

    m.addAttribute("paymentNo", paymentNo);
    return "fo/payment/paymentCompleteView";
  }

  @ResponseBody
  @PostMapping(value = "/paySuccess", produces = "text/html; charset=UTF-8")
  public String paySuccess(PayInfo pi) {

    // 결제정보 DB에 추가
    int result = paymentService.payComplete(pi);

    if(result == 1) {

      // 누적구매금액 업데이트
      int addTotal = paymentService.addTotalPay(pi);

        if(addTotal == 1) {

          // 등급 업데이트
          paymentService.updateGrade(pi);

        }
    }

    return String.valueOf(result); // 1 -> "1"
  }

//  @PostMapping("payCancel.pa")
//  public String paymentCancel() {



//  }

}