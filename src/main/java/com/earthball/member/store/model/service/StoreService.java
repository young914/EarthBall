package com.earthball.member.store.model.service;

import java.util.ArrayList;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.store.model.vo.Store;

public interface StoreService  {
  int selectStoreListCount();

  // 매장 리스트 조회
  ArrayList<Store> selectStoreList(PageInfo pi);

  // 매장 상세 조회
  Store selectStoreDetail(int storeNo);

  // 매장 좋아요 순 조회용
  ArrayList<Store> selectStoreLikeList();

}
