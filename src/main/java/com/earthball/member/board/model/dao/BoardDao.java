package com.earthball.member.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.board.model.vo.Board;

@Repository
public class BoardDao {

  public int selectListCount(SqlSessionTemplate sqlSession) {
    return sqlSession.selectOne("boardMapper.selectListCount");
  }

  public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
    int limit = pi.getBoardLimit(); // limit : 조회할 갯수

    RowBounds rowBounds = new RowBounds(offset, limit);

    return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
}

}
