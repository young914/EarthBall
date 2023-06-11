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
  public String selectList(String memberId, Model model) {
    System.out.println("여기는 selectList");
    if(memberId.equals("")) {
      memberId = "없다!";
    }
    System.out.println("memberId는 : " + memberId);
 // 전체 다 가져오기 
    ArrayList<Region> regionList = storeService.selectRegion();

    // 시/도 만 가져오기
    ArrayList<Region> cityList = storeService.selectCityList();
    
    
    model.addAttribute("memberId", memberId);
    model.addAttribute("regionList", regionList);
    model.addAttribute("cityList", cityList);
    return "fo/store/storeListView";
  }
  
  @ResponseBody
  @GetMapping(value = "getStores.st", produces = "application/json; charset=UTF-8")
  public String getStoreList(String memberId) {
    System.out.println("여기는 getStoreList");
    ArrayList<Store> list = storeService.selectAllStoreList();
    System.out.println("여기는 getStoreList 의 memberId : " + memberId );
    
    for (int i = 0; i < list.size(); i++) {
      GeocodingApi geocodingApi = new GeocodingApi();
      double[] coordinates = geocodingApi.getGeocode(list.get(i).getStoreAddress());
      double latitude = coordinates[0];
      double longitude = coordinates[1];
      String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);

      list.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
      list.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
      list.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
      
      boolean liked = storeService.isStoreLiked(memberId, list.get(i).getStoreNo());
      System.out.println("store번호 : " + list.get(i).getStoreNo()+ " 은 ? : " +   liked);
      list.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
    }
    
    return new Gson().toJson(list);
  }
  
  @ResponseBody
  @GetMapping(value = "getCities.st", produces = "application/json; charset=UTF-8")
  public String getCityFilter(String city, Model model) {
    System.out.println("getCityFilter");
    ArrayList<Region> provincesList = storeService.selectProvincesList(city); 
    
    return new Gson().toJson(provincesList);
 
  }
  
  @ResponseBody
  @GetMapping(value = "getFilter.st", produces = "application/json; charset=UTF-8")
  public String getFilterList(String city, String provinces, Model model) {
    System.out.println("getFilterList");
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
    System.out.println("selectNameSearch");
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
    System.out.println("selectLikeList");
    ArrayList<Store> likeList = storeService.selectLikeList(memberId);
    return "";
  }
  
  @ResponseBody
  @PostMapping(value= "storeLikes.st", produces = "application/json; charset=UTF-8")
  public boolean updatestoreLikes(int storeNo, boolean isLiked, int storeLikes, String memberId, Model model) {
    System.out.println("updatestoreLikes");
    System.out.println("storeNo : " + storeNo + " isLiked :  " + isLiked + " storeLikes : " + storeLikes + " memberId : " + memberId);

    if(isLiked == true) {
      int result1 = storeService.insertStoreLike(storeNo, memberId);
     System.out.println("result 1 : "  + result1);
      if(result1 > 0) {
        int result2 = storeService.updateStoreLikesCount(storeNo, storeLikes, isLiked);
        System.out.println("result2 : " + result2);
      }
      else {
        System.out.println("변경실패!");
      }
      model.addAttribute("isLiked", isLiked);
      return isLiked;
      
    } else {
      int result1 = storeService.deleteStoreLike(storeNo, memberId);
      if(result1 > 0) {
        int result2 = storeService.updateStoreLikesCount(storeNo, storeLikes, isLiked);
        System.out.println("result2 : " + result2);
      }
      else {
        System.out.println("변경실패!");
      }
      model.addAttribute("isLiked", isLiked);
      return isLiked;
    }
  }
}
