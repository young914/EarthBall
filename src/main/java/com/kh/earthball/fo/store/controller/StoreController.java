package com.kh.earthball.fo.store.controller;

import com.kh.earthball.common.template.Pagination;
import com.kh.earthball.common.vo.PageInfo;
import com.kh.earthball.fo.store.service.StoreService;
import com.kh.earthball.fo.store.template.GeocodingApi;
import com.kh.earthball.fo.store.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;


@Controller
public class StoreController {

  @Autowired
  private StoreService storeService;


  @RequestMapping("storeListView.st")
  public ModelAndView selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, ModelAndView mv) {
    int listCount = storeService.selectStoreListCount();
    int pageLimit = 20;
    int boardLimit = 10;
    System.out.println("잘되나?");
    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Store> list = storeService.selectStoreList(pi);
    System.out.println(list);
    for (int i = 0; i < list.size(); i++) {

      GeocodingApi geocodingApi = new GeocodingApi();
      double[] coordinates = geocodingApi.getGeocode(list.get(i).getStoreAddress());
      double latitude = coordinates[0];
      double longitude = coordinates[1];
      String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
      System.out.println(jibunAddress);

      list.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
      list.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
      list.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
    }

    mv.addObject("pi", pi).addObject("list", list).setViewName("member/store/storeListView");
    return mv;
  }


}
