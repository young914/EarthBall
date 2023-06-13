package com.kh.earthball.fo.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earthball.fo.board.service.BoardService;
import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;

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

  @RequestMapping("enrollForm.bo")
  public String enrollForm() {
   return  "fo/board/boardEnrollForm";
  }

  @RequestMapping(value = "/insert.bo", method = RequestMethod.POST)
  public String insertBoard(@ModelAttribute Board b, HttpSession session, Model model) {

      int result = boardService.insertBoard(b);

      if(result > 0) {

        return "redirect:/list.bo";
    } else {
        // Error handling or return an error page
        return "redirect:/error";
    }
  }

  @RequestMapping("delete.bo")
  public String deleteBoard(int bno, Model model, HttpSession session) {

    int result = boardService.deleteBoard(bno);

    if (result > 0) {

      session.setAttribute("alertMsg", "게시글 삭제 성공");

      return "redirect:/list.bo";
    } else {

      return "redirect:/error";
    }

  }

  @RequestMapping("updateForm.bo")
  public ModelAndView updateForm( ModelAndView mv,int bno) {

    Board b = boardService.selectBoard(bno);

    mv.addObject("b",b);
    mv.setViewName("fo/board/boardUpdateForm");

    return mv;
  }

  @RequestMapping("update.bo")
  public String updateBoard(Board b, HttpSession session) {
      int result = boardService.updateBoard(b);
      if (result > 0) {
        session.setAttribute("alertMsg", "게시글 성공!");
        return "redirect:/list.bo";
    } else {
        return "redirect:/error";
    }
}

  @RequestMapping("detail.bo")
  public ModelAndView selectBoard(ModelAndView mv, int bno) {

    Board b = boardService.selectBoard(bno);
    if (b != null) {
      // 이전글과 다음글의 존재 여부 확인
      Board hasPrev = boardService.selectPrevBoard(bno);
      Board hasNext = boardService.selectNextBoard(bno);

      mv.addObject("b", b);
      mv.addObject("hasPrev", hasPrev);
      mv.addObject("hasNext", hasNext);
      mv.setViewName("fo/board/boardDetailView");
    } else {
      mv.addObject("errorMsg", "게시글 상세조회 실패");
    }

    return mv;
  }

  @RequestMapping("list.faq")
  public ModelAndView selectfaq(ModelAndView mv) {

    mv.setViewName("fo/board/faq");

    return mv;

  }



}
