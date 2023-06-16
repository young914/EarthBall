package com.kh.earthball.fo.payment.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageItem;

@Mapper
public interface PaymentMapper {

  int payComplete(PayInfo pi);

  int addTotalPay(PayInfo pi);

  int updateGrade(PayInfo pi);

  Cart selectProductList(PayPageItem ppi);

  int insertOrder(Cart c);

}
