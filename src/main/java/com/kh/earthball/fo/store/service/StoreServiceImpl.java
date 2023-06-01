package com.kh.earthball.fo.store.service;

import com.kh.earthball.common.vo.PageInfo;
import com.kh.earthball.fo.store.dao.StoreDao;
import com.kh.earthball.fo.store.vo.Store;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class StoreServiceImpl implements StoreService {

  @Autowired
  private StoreDao storeDao;

  @Autowired
  private SqlSessionTemplate sqlSession;

  @Override
  public int selectStoreListCount() {
    return storeDao.selectStoreListCount(sqlSession);
  }

  @Override
  public ArrayList<Store> selectStoreList(PageInfo pi) {

    return storeDao.selectStoreList(sqlSession, pi);
  }

  @Override
  public Store selectStoreDetail(int storeNo) {

    return null;
  }

  @Override
  public ArrayList<Store> selectStoreLikeList() {
// TODO Auto-generated method stub
    return null;
  }


}
