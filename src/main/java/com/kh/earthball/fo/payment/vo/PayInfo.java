package com.kh.earthball.fo.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PayInfo {

  private String paymentNo;
  private String memberId;
  private String paymentType;
  private int paymentTotal;
  private String receiveName;
  private int receivePhone;
  private String postCode;
  private String receiveAddress1;
  private String receiveAddress2;
  private String deliveryComment;
  private String paymentToken;
}
