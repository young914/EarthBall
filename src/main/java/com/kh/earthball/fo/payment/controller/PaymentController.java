package com.kh.earthball.fo.payment.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.fo.cart.vo.Cart;
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

  // 장바구니 => 결제페이지 포워딩
  @PostMapping("payments.pa")
  public String paymentsPageForm(PayPageList ppl, Model model, HttpSession session) {

    session.removeAttribute("orderList");
    // System.out.println("orders : " + ppl.getOrders());

    model.addAttribute("orderList", paymentService.selectProductList(ppl.getOrders()));
    session.setAttribute("orderList", paymentService.selectProductList(ppl.getOrders()));

    System.out.println(session.getAttribute("orderList"));

    return "fo/payment/paymentPageForm";
  }

  //상품상세페이지 => 결제페이지 포워딩
 @PostMapping("payment.pa")
 public String paymentPageForm(PayPageList ppl, Model model, HttpSession session) {

   session.removeAttribute("orderList");
   System.out.println("orders : " + ppl.getOrders().get(0).getAmount());

   int amount = ppl.getOrders().get(0).getAmount();

   model.addAttribute("amount", amount);
   model.addAttribute("orderList", paymentService.selectProductList(ppl.getOrders()));
   session.setAttribute("orderList", paymentService.selectProductList(ppl.getOrders()));

   System.out.println(session.getAttribute("orderList"));

   return "fo/payment/paymentPageForm";
 }

  // 결제페이지 => 결제완료페이지 포워딩
  @PostMapping("payComplete.pa")
  public String paymentCompleteView(String paymentNo, Model m) {

    m.addAttribute("paymentNo", paymentNo);
    return "fo/payment/paymentCompleteView";
  }

  //결제 성공 시 실행
  @ResponseBody
  @PostMapping(value = "/paySuccess", produces = "text/html; charset=UTF-8")
  public String paySuccess(PayInfo pi, HttpSession session) {

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

  /*
  @ResponseBody
  @RequestMapping(value="/insertOrder", method=RequestMethod.POST)
  public String insertOrder(List<Cart> orderList) {

    int result = paymentService.insertOrder(orderList);

    return result;
  }
  */

}