package com.earthball.admin.challenge.service;

import java.util.List;

import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.common.vo.PageInfo;

public interface GrpCodeService {

  int insertGrp(GrpCodeDto grpCodeDto);

  int selectListCount();

  List<GrpCodeDto> selectList(PageInfo pi);

  GrpCodeDto selectGrp(String grpCode);

  int updateGrp(GrpCodeDto grpCodeDto);

  int deleteGrp(String grpCode);
}
