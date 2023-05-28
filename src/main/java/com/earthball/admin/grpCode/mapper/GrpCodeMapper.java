package com.earthball.admin.grpCode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.earthball.admin.common.vo.PageInfo;
import com.earthball.admin.grpCode.vo.GrpCode;

@Mapper
public interface GrpCodeMapper {

	int insertGrp(GrpCode grpCode);

	int selectListCount();

	List<GrpCode> selectList(PageInfo pi, RowBounds rowBounds);

	GrpCode selectGrp(String grpCode);

	int updateGrp(GrpCode grpCode);

	int deleteGrp(String grpCode);
}
