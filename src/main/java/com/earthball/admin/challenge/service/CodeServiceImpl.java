package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.admin.challenge.mapper.CodeMapper;
import com.earthball.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class CodeServiceImpl implements CodeService {

  private final CodeMapper codeMapper;

  @Override
  public int insertGrp(GrpCodeDto grpCodeDto) {
    return codeMapper.insertGrp(grpCodeDto);
  }

  @Override
  public int selectListCount() {
    return codeMapper.selectListCount();
  }

  @Override
  public List<GrpCodeDto> selectList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return codeMapper.selectList(pi, rowBounds);
  }

  @Override
  public GrpCodeDto selectGrp(String grpCode) {
    return codeMapper.selectGrp(grpCode);
  }

  @Override
  public int updateGrp(GrpCodeDto grpCodeDto) {
    return codeMapper.updateGrp(grpCodeDto);
  }

  @Override
  public int deleteGrp(String grpCode) {
    return codeMapper.deleteGrp(grpCode);
  }

  @Override
  public int insertCode(CodeDto codeDto) {
    int result = codeMapper.insertCode(codeDto);

//		log.info("Code 들어왔니? 서비스 : " + code);
//		log.info("result? 서비스 : " + result);

    return result;
  }

  @Override
  public List<CodeDto> selectCodeList(String grpCode) {
    return codeMapper.selectCodeList(grpCode);
  }

  @Override
  public CodeDto selectCode(String grpCode, String code) {
    return codeMapper.selectCode(grpCode, code);
  }

  @Transactional
  @Override
  public int updateCode(CodeDto codeDto) {

    log.info("service에 업데이트 넘어옴?:" + codeDto);

    int result = codeMapper.updateCode(codeDto);

    log.info("업데이트 result 나왔음? : " + result);

    return result;
  }

  @Override
  public int deleteCode(String grpCode, String code) {
    return codeMapper.deleteCode(grpCode, code);
  }

}
