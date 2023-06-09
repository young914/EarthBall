package com.kh.earthball.fo.challenge.mapper;

import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ConfirmMapper {

  int insertConfirm(ChConfirm chConfirm);

  int updateConfirm(ChConfirm chConfirm);

  int deleteDetailInfo(ChConfirm chConfirm);

  int insertDetailInfo(ChDetailInfo chDetailInfo);

  int selectListCount(int chNo);

  List<ChConfirm> selectConfirmList(@Param("offset") int offset, @Param("limit") int limit, @Param("chNo") int chNo);

  ChConfirm selectConfirm(int chConNo);

  List<ChDetailInfo> selectDetailInfoList(ChDetailInfoParam detailInfoParam);

  int deleteConfirm(ChConfirm chConfirm);

 // int deleteDetailInfo(ChConfirm chConfirm);
}


