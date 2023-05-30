package com.earthball.member.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class PaymentController {

  @RequestMapping("payment.pa")
  public String paymentPageForm() {
    return "member/payment/paymentPageForm";
  }

  @RequestMapping("payComplete.pa")
  public String paymentCompleteView() {
    return "member/payment/paymentCompleteView";
  }

}
