package com.earthball.admin.grpCode.service;

import java.util.List;

import com.earthball.admin.common.vo.PageInfo;
import com.earthball.admin.grpCode.vo.GrpCode;

public interface GrpCodeService {

	int insertGrp(GrpCode grpCode);

	int selectListCount();

	List<GrpCode> selectList(PageInfo pi);

	GrpCode selectGrp(String grpCode);

	int updateGrp(GrpCode grpCode);

	int deleteGrp(String grpCode);
}
