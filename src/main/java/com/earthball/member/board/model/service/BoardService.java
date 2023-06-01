package com.earthball.member.board.model.service;

import java.util.ArrayList;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.board.model.vo.Board;

public interface BoardService {

  // 게시글 총 개수 조회
  int selectListCount();

  // 게시글 리스트 조회
  ArrayList<Board> selectList(PageInfo pi);


}
