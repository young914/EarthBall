package com.earthball.admin.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.earthball.admin.code.vo.Code;

@Mapper
public interface CodeMapper {

	int insertCode(Code code);

	List<Code> selectCodeList(String grpCode);

	Code selectCode(String grpCode, String code);

	int updateCode(Code code);

	int deleteCode(String grpCode, String code);

}
