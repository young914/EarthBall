              package com.kh.earthball.fo.board.dao;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.board.vo.Board;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class BoardDao {

  public int selectListCount(SqlSessionTemplate sqlSession) {
    return sqlSession.selectOne("boardMapper.selectListCount");
  }

  public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
    int limit = pi.getBoardLimit(); // limit : 조회할 갯수

    RowBounds rowBounds = new RowBounds(offset, limit);

    return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
  }

}
