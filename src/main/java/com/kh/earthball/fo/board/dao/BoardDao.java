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

  public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
    return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
}

  public Board selectPrevBoard(SqlSessionTemplate sqlSession, int boardNo) {
    return sqlSession.selectOne("boardMapper.selectPrevBoard", boardNo) ;
  }

public Board selectNextBoard(SqlSessionTemplate sqlSession, int boardNo) {
  return sqlSession.selectOne("boardMapper.selectNextBoard", boardNo);
  }

public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
  return sqlSession.insert("boardMapper.insertBoard", b);
}

public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
  return sqlSession.update("boardMapper.deleteBoard", boardNo);
}

public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
  return sqlSession.update("boardMapper.updateBoard", b);
}



}
