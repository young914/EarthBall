package com.kh.earthball.fo.store.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;

@Mapper
public interface StoreMapper {

    int selectStoreListCount();

    ArrayList<Store> selectStoreList(@Param("pi") PageInfo pi);
    
    ArrayList<Store> selectAllStoreList();

    ArrayList<Region> selectRegion();

    ArrayList<Region> selectCityList();

    ArrayList<Region> selectProvincesList(@Param("city") String city);

    int selectRegionNo(@Param("city") String city, @Param("provinces") String province);

    ArrayList<Store> selectFilterListR(@Param("regionNo") int regionNo);

    ArrayList<Store> selectFilterListC(@Param("city") String city);

    ArrayList<Store> selectNameSearch(@Param("searchValue") String searchValue);

    int insertStoreLike(@Param("storeNo") int storeNo, @Param("memberId") String memberId);

    int deleteStoreLike(@Param("storeNo") int storeNo, @Param("memberId") String memberId);
//
    int updateStoreLikesCount(@Param("storeNo") int storeNo, @Param("storeLikes") int storeLikes, @Param("isLiked") boolean isLiked);

    boolean isStoreLiked(@Param("memberId") String memberId, @Param("storeNo") int storeNo);

    ArrayList<Store> selectLikeStore(@Param("memberId") String memberId);


}