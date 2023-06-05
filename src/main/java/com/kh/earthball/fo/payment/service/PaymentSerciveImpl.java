package com.kh.earthball.fo.payment.service;

import org.springframework.stereotype.Service;
import com.kh.earthball.fo.payment.mapper.PaymentMapper;
import com.kh.earthball.fo.payment.vo.PayInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentSerciveImpl implements PaymentService {

  private final PaymentMapper paymentMapper;

  @Override
  public int payComplete(PayInfo pi) {

    System.out.println(pi);

    return paymentMapper.payComplete(pi);
  }

}
