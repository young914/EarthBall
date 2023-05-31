package com.earthball.member.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao {

    public int selectStoreListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("storeMapper.selectStoreListCount");
    }

}
