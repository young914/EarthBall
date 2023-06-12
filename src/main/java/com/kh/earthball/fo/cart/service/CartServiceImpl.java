package com.kh.earthball.fo.cart.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.cart.mapper.CartMapper;
import com.kh.earthball.fo.cart.vo.Cart;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService  {

  private final CartMapper cartMapper;

  @Override
  public ArrayList<Cart> selectList(String memberID) {
    return cartMapper.selectList(memberID);
  }

}
