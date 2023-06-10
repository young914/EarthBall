package com.kh.earthball.fo.store.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kh.earthball.fo.store.service.StoreService;
import com.kh.earthball.fo.store.template.GeocodingApi;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class StoreController {

  private final StoreService storeService;
  
  @GetMapping("storeListView.st")
  public String selectList(Model model) {
    
 // 전체 다 가져오기 
    ArrayList<Region> regionList = storeService.selectRegion();

    // 시/도 만 가져오기
    ArrayList<Region> cityList = storeService.selectCityList();
    
    
    model.addAttribute("regionList", regionList);
    model.addAttribute("cityList", cityList);
    return "fo/store/storeListView";
  }
  
  @ResponseBody
  @GetMapping(value = "getStores.st", produces = "application/json; charset=UTF-8")
  public String getStoreList() {
     
    ArrayList<Store> list = storeService.selectAllStoreList();
    
    for (int i = 0; i < list.size(); i++) {

      GeocodingApi geocodingApi = new GeocodingApi();
      double[] coordinates = geocodingApi.getGeocode(list.get(i).getStoreAddress());
      double latitude = coordinates[0];
      double longitude = coordinates[1];
      String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);

      list.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
      list.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
      list.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
    }
    
    return new Gson().toJson(list);
  }
  
  @ResponseBody
  @GetMapping(value = "getCities.st", produces = "application/json; charset=UTF-8")
  public String getCityFilter(String city, Model model) {
    
    ArrayList<Region> provincesList = storeService.selectProvincesList(city); 
    
    return new Gson().toJson(provincesList);
 
  }
  
  @ResponseBody
  @GetMapping(value = "getFilter.st", produces = "application/json; charset=UTF-8")
  public String getFilterList(String city, String provinces, Model model) {
    if(provinces.equals("")) {
      ArrayList<Store> selectFilterList = storeService.selectFilterListC(city);
      
      for (int i = 0; i < selectFilterList.size(); i++) {
        GeocodingApi geocodingApi = new GeocodingApi();
        double[] coordinates = geocodingApi.getGeocode(selectFilterList.get(i).getStoreAddress());
        double latitude = coordinates[0];
        double longitude = coordinates[1];
        String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
        selectFilterList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
        selectFilterList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
        selectFilterList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
      }
      
    return new Gson().toJson(selectFilterList);
    }
    
    else {
      int regionNo = storeService.selectRegionNo(city, provinces);
      
      ArrayList<Store> selectFilterList = storeService.selectFilterListR(regionNo);
      
      for (int i = 0; i < selectFilterList.size(); i++) {

        GeocodingApi geocodingApi = new GeocodingApi();
        double[] coordinates = geocodingApi.getGeocode(selectFilterList.get(i).getStoreAddress());
        double latitude = coordinates[0];
        double longitude = coordinates[1];
        String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);

        selectFilterList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
        selectFilterList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
        selectFilterList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
      }
      return new Gson().toJson(selectFilterList);
    }
  }
  
  @ResponseBody
  @GetMapping(value = "getNameSearch.st" , produces = "application/json; charset=UTF-8")
  public String selectNameSearch(String searchValue, Model model ) {
    
    ArrayList<Store> nameSearchList = storeService.selectNameSearch(searchValue);
    
    if (nameSearchList == null || nameSearchList.isEmpty()) {
      nameSearchList = new ArrayList<>();
    } else {
        for (int i = 0; i < nameSearchList.size(); i++) {
            GeocodingApi geocodingApi = new GeocodingApi();
            double[] coordinates = geocodingApi.getGeocode(nameSearchList.get(i).getStoreAddress());
            double latitude = coordinates[0];
            double longitude = coordinates[1];
            String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
      
            nameSearchList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
            nameSearchList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
            nameSearchList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
        }
    }
    
    return new Gson().toJson(nameSearchList);
  }
  
  @ResponseBody
  @PostMapping(value= "likeListView.st", produces = "application/json; charset=UTF-8")
  public String selectLikeList(String memberId, Model model) {
    ArrayList<Store> likeList = storeService.selectLikeList(memberId);
    return "";
  }
  
  @ResponseBody
  @PostMapping(value= "storeLike.st", produces = "application/json; charset=UTF-8")
  public String updateStoreLike(int storeNo, boolean isLiked,Model model) {
     System.out.println("storeNo : " + storeNo + "isLiked :  " + isLiked);
    return "";
  }
}
