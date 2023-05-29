package com.earthball.admin.challenge.mapper;

import java.util.List;

import com.earthball.admin.challenge.dto.GrpCodeDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.earthball.common.vo.PageInfo;

@Mapper
public interface GrpCodeMapper {

  int insertGrp(GrpCodeDto grpCodeDto);

  int selectListCount();

  List<GrpCodeDto> selectList(PageInfo pi, RowBounds rowBounds);

  GrpCodeDto selectGrp(String grpCode);

  int updateGrp(GrpCodeDto grpCodeDto);

  int deleteGrp(String grpCode);
}
