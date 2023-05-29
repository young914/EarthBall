package com.earthball.admin.challenge.mapper;

import com.earthball.admin.challenge.dto.CodeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CodeMapper {

  int insertCode(CodeDto codeDto);

  List<CodeDto> selectCodeList(String grpCode);

  CodeDto selectCode(String grpCode, String code);

  int updateCode(CodeDto codeDto);

  int deleteCode(String grpCode, String code);

}
