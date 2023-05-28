package com.earthball.admin.code.service;

import com.earthball.admin.code.vo.Code;

import java.util.List;

public interface CodeService {

	int insertCode(Code code);

	List<Code> selectCodeList(String grpCode);

	Code selectCode(String grpCode, String code);

	int updateCode(Code code);

	int deleteCode(String grpCode, String code);

}
