package com.kh.earthball.fo.cart.service;

import java.util.ArrayList;
import com.kh.earthball.fo.cart.vo.Cart;

public interface CartService {

  ArrayList<Cart> selectList(String memberID);

}
