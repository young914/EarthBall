package com.kh.earthball.fo.store.mapper;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Store;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface StoreMapper {

    int selectStoreListCount();

    ArrayList<Store> selectStoreList(@Param("pi") PageInfo pi);

}