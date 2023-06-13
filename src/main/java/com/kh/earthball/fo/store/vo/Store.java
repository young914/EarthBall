package com.kh.earthball.fo.store.vo;

import lombok.*;

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
  private int storeLikes;
  private double storeLat;
  private double storeLon;
  private int storeRegionNo;
  private String storeInfo;
  private String status;
  private String jibunAddress;
  private boolean isLiked;
  private String changerName;
  private int fileLevel;
}
