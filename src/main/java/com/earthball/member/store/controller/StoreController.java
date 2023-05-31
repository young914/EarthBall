package com.earthball.member.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.earthball.common.template.Pagination;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.store.model.service.StoreService;
import com.earthball.member.store.model.vo.Store;


@Controller
public class StoreController{

  @Autowired
  private StoreService storeService;
  
  
  
  @RequestMapping("storeListView.st")
  public String selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
    
    int listCount = storeService.selectStoreListCount();
    
    int pageLimit = 20;
    int boardLimit = 5;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Store> list = storeService.selectStoreList(pi);

    mv.addObject("pi", pi).addObject("list", list).setViewName("member/store/storeListView");
    return "member/store/storeListView";
  }
}
