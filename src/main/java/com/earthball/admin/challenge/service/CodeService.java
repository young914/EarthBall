package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.common.vo.PageInfo;

import java.util.List;

public interface CodeService {

  int insertGrp(GrpCodeDto grpCodeDto);

  int selectListCount();

  List<GrpCodeDto> selectList(PageInfo pi);

  GrpCodeDto selectGrp(String grpCode);

  int updateGrp(GrpCodeDto grpCodeDto);

  int deleteGrp(String grpCode);

  int insertCode(CodeDto codeDto);

  List<CodeDto> selectCodeList(String grpCode);

  CodeDto selectCode(String grpCode, String code);

  int updateCode(CodeDto codeDto);

  int deleteCode(String grpCode, String code);

}
