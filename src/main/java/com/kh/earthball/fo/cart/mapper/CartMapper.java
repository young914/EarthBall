package com.kh.earthball.fo.cart.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.kh.earthball.fo.cart.vo.Cart;

@Mapper
public interface CartMapper {

  ArrayList<Cart> selectList(String memberId);

}
