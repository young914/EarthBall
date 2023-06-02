package com.kh.earthball.fo.store.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.service.StoreService;
import com.kh.earthball.fo.store.template.GeocodingApi;
import com.kh.earthball.fo.store.vo.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class StoreController {

  private final StoreService storeService;
  
  @GetMapping("storeListView.st")
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, Model model) {
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

    model.addAttribute("pi", pi);
    model.addAttribute("list", list);
    return "fo/store/storeListView";
  }

}
