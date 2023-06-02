package com.kh.earthball.fo.payment.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.kh.earthball.fo.payment.vo.PayInfo;

@Mapper
public interface PaymentMapper {

  int payComplete(PayInfo pi);

}
