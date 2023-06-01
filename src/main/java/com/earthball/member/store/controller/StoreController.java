package com.earthball.member.store.controller;

import java.io.IOException;
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
import com.earthball.member.store.template.GeocodingApi;
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;


@Controller
public class StoreController{

  @Autowired
  private StoreService storeService;
  
  
  
  @RequestMapping("storeListView.st")
  public ModelAndView selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
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
          list.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
          list.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
          
      }

      mv.addObject("pi", pi).addObject("list", list).setViewName("member/store/storeListView");
      return mv;
  }
  
  
  
  
}
