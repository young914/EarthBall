package com.earthball.member.store.model.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.store.model.dao.StoreDao;
import com.earthball.member.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService{

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
return null;
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
