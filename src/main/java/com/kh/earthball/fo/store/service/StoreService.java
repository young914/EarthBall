package com.kh.earthball.fo.store.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Store;

import java.util.ArrayList;

public interface StoreService {
  // 매장 수 조회 
  int selectStoreListCount();

  // 매장 리스트 조회
  ArrayList<Store> selectStoreList(PageInfo pi);

//  // 매장 상세 조회
//  Store selectStoreDetail(int storeNo);
//
  // 매장 좋아요 순 조회용
//  ArrayList<Store> selectStoreLikeList();

}
