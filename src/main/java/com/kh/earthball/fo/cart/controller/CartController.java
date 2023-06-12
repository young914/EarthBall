package com.kh.earthball.fo.cart.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.kh.earthball.fo.cart.service.CartService;
import com.kh.earthball.fo.cart.vo.Cart;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class CartController {

  private final CartService cartService;

  @GetMapping("cart.me")
  public String cart(String memberId, Model model){
    ArrayList<Cart> list = cartService.selectList(memberId);

    model.addAttribute("list", list);

    return "fo/cart/cart";
  }
}
