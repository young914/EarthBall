package com.kh.earthball.fo.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class CartController {

  @GetMapping("cart.me")
  public String cart(String memberId){
    return "fo/cart/cart";
  }
}
