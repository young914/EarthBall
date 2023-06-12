package com.kh.earthball.fo.cart.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kh.earthball.fo.cart.service.CartService;
import com.kh.earthball.fo.cart.vo.Cart;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class CartController {

  private final CartService cartService;

  @GetMapping("cart.me")
  public String cart(){
//
//    ArrayList<Cart> list = cartService.selectList(memberId, pi);
//
//    System.out.println(list);
//
//    model.addAttribute("list", list);

    return "fo/cart/cart";
  }

  @ResponseBody
  @GetMapping(value="list.cart", produces="application/json; charset=UTF-8")
  public String ajaxCartList(String memberId) {
    ArrayList<Cart> list = cartService.selectList(memberId);

    System.out.println(list);

    return new Gson().toJson(list);

  }
}
