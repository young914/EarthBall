package com.kh.earthball.fo.board.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.board.dao.BoardDao;
import com.kh.earthball.fo.board.vo.Board;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BoardServiceImpl implements BoardService {

  @Autowired
  SqlSessionTemplate sqlSession;
  @Autowired
  private BoardDao boardDao;

  @Override
  public int selectListCount() {
    return boardDao.selectListCount(sqlSession);
  }

  @Override
  public ArrayList<Board> selectList(PageInfo pi) {
    return boardDao.selectList(sqlSession, pi);
  }


}
