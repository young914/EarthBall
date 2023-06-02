package com.kh.earthball.fo.board.controller;

import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.board.service.BoardService;
import com.kh.earthball.fo.board.vo.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class BoardController {

  @Autowired
  private BoardService boardService;

  @RequestMapping("list.bo")
  public ModelAndView selectList(
      @RequestParam(value = "cPage", defaultValue = "1") int currentPage,
      ModelAndView mv) {

    int listCount = boardService.selectListCount();

    int pageLimit = 10;
    int boardLimit = 5;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Board> list = boardService.selectList(pi);

    mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("fo/board/boardListView");

    return mv;
  }

}
