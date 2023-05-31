package com.earthball.member.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Store {
  private int storeNo;
  private String storeName;
  private String storeAddress;
  private String storePhone;
  private String businessHours;
  private int storeRc;
  private double storeLat;
  private double storeLon;
  private int storeRegionNo;
  private String storeInfo;
  private String status;
}
