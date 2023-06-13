package com.kh.earthball.bo.store.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;

@Mapper
public interface AdminStoreMapper {

  int selectListCount();

  int insertStore(AdminStore s);

  int insertStoreAtta(AdminAtta at);

  ArrayList<AdminStore> adminAllStoreList(PageInfo pi, RowBounds rowBounds);



}
