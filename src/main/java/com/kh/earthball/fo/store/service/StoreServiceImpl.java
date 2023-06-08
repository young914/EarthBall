package com.kh.earthball.fo.store.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.mapper.StoreMapper;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

  private final StoreMapper storeMapper;

  @Override
  public int selectStoreListCount() {
    return storeMapper.selectStoreListCount();
  }

  @Override
  public ArrayList<Store> selectStoreList(PageInfo pi) {

    return storeMapper.selectStoreList(pi);
  }

  @Override
  public ArrayList<Store> selectAllStoreList() {
    return storeMapper.selectAllStoreList();
  }

  @Override
  public ArrayList<Region> selectRegion() {
    return storeMapper.selectRegion();
  }

  @Override
  public ArrayList<Region> selectCityList() {
    return storeMapper.selectCityList();
  }

  @Override
  public ArrayList<Region> selectProvincesList(String city) {
   return storeMapper.selectProvincesList(city);
  }

  @Override
  public int selectRegionNo(String city, String provinces) {
    return storeMapper.selectRegionNo(city, provinces);
  }

  @Override
  public ArrayList<Store> selectFilterListC(String city) {
    return storeMapper.selectFilterListC(city);
  }

  @Override
  public ArrayList<Store> selectFilterListR(int regionNo) {
    return storeMapper.selectFilterListR(regionNo);
  }

  @Override
  public ArrayList<Store> selectNameSearch(String searchValue) {
    return storeMapper.selectNameSearch(searchValue);
  }

}
