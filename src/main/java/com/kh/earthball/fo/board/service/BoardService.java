package com.kh.earthball.fo.board.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.board.vo.Board;

import java.util.ArrayList;

public interface BoardService {

  // 게시글 총 개수 조회
  int selectListCount();

  // 게시글 리스트 조회
  ArrayList<Board> selectList(PageInfo pi);


}
