package com.earthball.board.model.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.earthball.board.model.dao.BoardDao;
import com.earthball.board.model.vo.Board;
import com.earthball.common.vo.PageInfo;

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
