package com.kh.earthball.fo.payment.service;

import java.util.List;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageItem;

public interface PaymentService {

  int payComplete(PayInfo pi);

  int addTotalPay(PayInfo pi);

  int updateGrade(PayInfo pi);

  List<Cart> selectProductList(List<PayPageItem> orders);

  int insertOrder(List<Cart> orderList);

}
