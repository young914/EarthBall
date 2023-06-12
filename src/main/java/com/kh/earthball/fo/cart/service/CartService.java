package com.kh.earthball.fo.cart.service;

import java.util.ArrayList;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface CartService {

  ArrayList<Cart> selectList(String memberId);

}
