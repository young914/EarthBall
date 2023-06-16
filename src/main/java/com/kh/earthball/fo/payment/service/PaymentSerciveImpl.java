package com.kh.earthball.fo.payment.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.payment.mapper.PaymentMapper;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageItem;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentSerciveImpl implements PaymentService {

  private final PaymentMapper paymentMapper;

  @Override
  public int payComplete(PayInfo pi) {

    return paymentMapper.payComplete(pi);
  }

  @Override
  public int addTotalPay(PayInfo pi) {

    return paymentMapper.addTotalPay(pi);
  }

  @Override
  public int updateGrade(PayInfo pi) {

    return paymentMapper.updateGrade(pi);
  }

  @Override
  public List<Cart> selectProductList(List<PayPageItem> orders) {

    List<Cart> list = new ArrayList<Cart>();

    for(PayPageItem ppi : orders) {

      Cart productInfo = paymentMapper.selectProductList(ppi);

      list.add(productInfo);
    }

    return list;
  }

  @Override
  public int insertOrder(List<Cart> orderList) {

    int result = 0;

    for(Cart c : orderList) {

      result = paymentMapper.insertOrder(c);

    }

    return result;
  }

}
