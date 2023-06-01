package com.earthball.member.board.model.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.board.model.dao.BoardDao;
import com.earthball.member.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

  @Autowired
  private BoardDao boardDao;

  @Autowired SqlSessionTemplate sqlSession;

  @Override
  public int selectListCount() {
    return boardDao.selectListCount(sqlSession);
  }

  @Override
  public ArrayList<Board> selectList(PageInfo pi) {
    return boardDao.selectList(sqlSession, pi);
  }


}
