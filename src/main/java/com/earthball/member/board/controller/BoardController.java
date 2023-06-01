package com.earthball.member.board.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.earthball.common.template.Pagination;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.board.model.service.BoardService;
import com.earthball.member.board.model.vo.Board;

@Controller
public class BoardController {

  @Autowired
  private BoardService boardService;

  @RequestMapping("list.bo")
  public ModelAndView selectList(
      @RequestParam(value="cPage", defaultValue = "1") int currentPage,
      ModelAndView mv) {

    int listCount = boardService.selectListCount();

    int pageLimit = 10;
    int boardLimit = 5;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Board> list = boardService.selectList(pi);

    mv.addObject("pi", pi)
    .addObject("list", list)
    .setViewName("board/boardListView");

    return mv;
  }

}
