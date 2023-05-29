package com.earthball.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController{
  @RequestMapping("storeListView.st")
 public String selectList() {
    return "store/storeListView";
   
 }
}
