package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.fo.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface CodeMapper {

  int insertGrp(GrpCode grpCode);

  int selectListCount();

  List<GrpCode> selectList(PageInfo pi, RowBounds rowBounds);

  GrpCode selectGrp(String grpCode);

  int updateGrp(GrpCode grpCode);

  int deleteGrp(String grpCode);

  int insertCode(Code code);

  List<Code> selectCodeList(String grpCode);

  Code selectCode(String grpCode, String code);

  int updateCode(Code code);

  int deleteCode(String grpCode, String code);

}
