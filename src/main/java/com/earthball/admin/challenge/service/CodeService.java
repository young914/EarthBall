package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CodeDto;

import java.util.List;

public interface CodeService {

  int insertCode(CodeDto codeDto);

  List<CodeDto> selectCodeList(String grpCode);

  CodeDto selectCode(String grpCode, String code);

  int updateCode(CodeDto codeDto);

  int deleteCode(String grpCode, String code);

}
