package com.kh.earthball.fo.board.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.board.dao.BoardDao;
import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.common.vo.PageInfo;

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

  @Override
  public Board selectBoard(int boardNo) {
    return boardDao.selectBoard(sqlSession, boardNo);

  }

  @Override
  public Board selectPrevBoard(int boardNo) {
    return boardDao.selectPrevBoard(sqlSession, boardNo);
  }

  @Override
  public Board selectNextBoard(int boardNo) {
    return boardDao.selectNextBoard(sqlSession, boardNo);
  }

  @Override
  public int insertBoard(Board b) {
    return boardDao.insertBoard(sqlSession, b);
  }
}
