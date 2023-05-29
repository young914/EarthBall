package com.earthball.admin.challenge.service;

import java.util.List;

import com.earthball.admin.challenge.mapper.GrpCodeMapper;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.earthball.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class GrpCodeServiceImpl implements GrpCodeService {

  private final GrpCodeMapper grpCodeMapper;

  @Override
  public int insertGrp(GrpCodeDto grpCodeDto) {
    return grpCodeMapper.insertGrp(grpCodeDto);
  }

  @Override
  public int selectListCount() {
    return grpCodeMapper.selectListCount();
  }

  @Override
  public List<GrpCodeDto> selectList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return grpCodeMapper.selectList(pi, rowBounds);
  }

  @Override
  public GrpCodeDto selectGrp(String grpCode) {
    return grpCodeMapper.selectGrp(grpCode);
  }

  @Override
  public int updateGrp(GrpCodeDto grpCodeDto) {
    return grpCodeMapper.updateGrp(grpCodeDto);
  }

  @Override
  public int deleteGrp(String grpCode) {
    return grpCodeMapper.deleteGrp(grpCode);
  }

}
