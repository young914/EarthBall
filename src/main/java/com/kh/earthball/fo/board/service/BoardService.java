package com.kh.earthball.fo.board.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.board.vo.Board;

import java.util.ArrayList;

public interface BoardService {

  // 게시글 총 개수 조회
  int selectListCount();

  // 게시글 리스트 조회
  ArrayList<Board> selectList(PageInfo pi);

  // 게시글 상세 조회
  Board selectBoard(int boardNo);

  // 게시글 작성
  int insertBoard(Board b);

  // 게시글 삭제
  int deleteBoard(int boardNo);

  // 게시글 수정
  int updateBoard(Board b);

  // 이전글 조회
  Board selectPrevBoard(int boardNo);

  // 다음글 조회
  Board selectNextBoard(int boardNo);




}
