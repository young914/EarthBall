package com.kh.earthball.fo.store.dao;

import com.kh.earthball.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Store;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class StoreDao {

  public int selectStoreListCount(SqlSessionTemplate sqlSession) {
    return sqlSession.selectOne("storeMapper.selectStoreListCount");
  }

  public ArrayList<Store> selectStoreList(SqlSessionTemplate sqlSession, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
    int limit = pi.getBoardLimit(); // limit : 조회할 갯수
    RowBounds rowBounds = new RowBounds(offset, limit);

    return (ArrayList) sqlSession.selectList("storeMapper.selectStoreList", null, rowBounds);
  }

}
