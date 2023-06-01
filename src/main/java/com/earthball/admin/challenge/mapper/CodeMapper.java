package com.earthball.admin.challenge.mapper;

import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface CodeMapper {

  int insertGrp(GrpCodeDto grpCodeDto);

  int selectListCount();

  List<GrpCodeDto> selectList(PageInfo pi, RowBounds rowBounds);

  GrpCodeDto selectGrp(String grpCode);

  int updateGrp(GrpCodeDto grpCodeDto);

  int deleteGrp(String grpCode);

  int insertCode(CodeDto codeDto);

  List<CodeDto> selectCodeList(String grpCode);

  CodeDto selectCode(String grpCode, String code);

  int updateCode(CodeDto codeDto);

  int deleteCode(String grpCode, String code);

}
