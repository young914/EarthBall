package com.kh.earthball.fo.cart.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.common.vo.PageInfo;

@Mapper
public interface CartMapper {
  
  ArrayList<Cart> selectList(String memberId);

}
