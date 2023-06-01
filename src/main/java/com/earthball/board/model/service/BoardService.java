package com.earthball.board.model.service;

import java.util.ArrayList;
import com.earthball.board.model.vo.Board;
import com.earthball.common.vo.PageInfo;

public interface BoardService {

  // 게시글 총 개수 조회
  int selectListCount();

  // 게시글 리스트 조회
  ArrayList<Board> selectList(PageInfo pi);


}
