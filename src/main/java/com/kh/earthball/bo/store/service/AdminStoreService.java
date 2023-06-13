package com.kh.earthball.bo.store.service;

import java.util.ArrayList;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Store;

public interface AdminStoreService {

  int selectListCount();

  int insertStore(AdminStore s, ArrayList<AdminAtta> list);

  ArrayList<AdminStore> adminAllStoreList(PageInfo pi);



}
