package com.earthball.admin.grpCode.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.earthball.admin.common.vo.PageInfo;
import com.earthball.admin.grpCode.mapper.GrpCodeMapper;
import com.earthball.admin.grpCode.vo.GrpCode;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class GrpCodeServiceImpl implements GrpCodeService{

	private final GrpCodeMapper grpCodeMapper;

	@Override
	public int insertGrp(GrpCode grpCode) {
		return grpCodeMapper.insertGrp(grpCode);
	}

	@Override
	public int selectListCount() {
		return grpCodeMapper.selectListCount();
	}

	@Override
	public List<GrpCode> selectList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return grpCodeMapper.selectList(pi, rowBounds);
	}

	@Override
	public GrpCode selectGrp(String grpCode) {
		return grpCodeMapper.selectGrp(grpCode);
	}

	@Override
	public int updateGrp(GrpCode grpCode) {
		return grpCodeMapper.updateGrp(grpCode);
	}

	@Override
	public int deleteGrp(String grpCode) {
		return grpCodeMapper.deleteGrp(grpCode);
	}

}
