package com.kh.earthball.fo.store.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.mapper.StoreMapper;
import com.kh.earthball.fo.store.vo.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

  private final StoreMapper storeMapper;

  @Override
  public int selectStoreListCount() {
    return storeMapper.selectStoreListCount();
  }

  @Override
  public ArrayList<Store> selectStoreList(PageInfo pi) {

    return storeMapper.selectStoreList(pi);
  }
//
//  @Override
//  public Store selectStoreDetail(int storeNo) {
//
//    return null;
//  }
//
//  @Override
//  public ArrayList<Store> selectStoreLikeList() {
//// TODO Auto-generated method stub
//    return null;
//  }


}
