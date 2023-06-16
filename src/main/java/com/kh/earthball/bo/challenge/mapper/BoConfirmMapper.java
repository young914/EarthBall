package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.BoConfirm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoConfirmMapper {

  int ConfirmListCount();

  List<BoConfirm> selectConfirmList(@Param("offset") int offset, @Param("limit") int limit);

  BoConfirm selectConfirm(int chConNo);
}
