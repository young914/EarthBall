package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.CodeMapper;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.common.vo.PageInfo;
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
  public int insertGrp(GrpCode grpCode) {
    return codeMapper.insertGrp(grpCode);
  }

  @Override
  public int selectListCount() {
    return codeMapper.selectListCount();
  }

  @Override
  public List<GrpCode> selectList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return codeMapper.selectList(pi, rowBounds);
  }

  @Override
  public GrpCode selectGrp(String grpCode) {
    return codeMapper.selectGrp(grpCode);
  }

  @Override
  public int updateGrp(GrpCode grpCode) {
    return codeMapper.updateGrp(grpCode);
  }

  @Override
  public int deleteGrp(String grpCode) {
    return codeMapper.deleteGrp(grpCode);
  }

  @Override
  public int insertCode(Code code) {
    int result = codeMapper.insertCode(code);

//		log.info("Code 들어왔니? 서비스 : " + code);
//		log.info("result? 서비스 : " + result);

    return result;
  }

  @Override
  public List<Code> selectCodeList(String grpCode) {
    return codeMapper.selectCodeList(grpCode);
  }

  @Override
  public Code selectCode(String grpCode, String code) {
    return codeMapper.selectCode(grpCode, code);
  }

  @Transactional
  @Override
  public int updateCode(Code code) {

    log.info("service에 업데이트 넘어옴?:" + code);

    int result = codeMapper.updateCode(code);

    log.info("업데이트 result 나왔음? : " + result);

    return result;
  }

  @Override
  public int deleteCode(String grpCode, String code) {
    return codeMapper.deleteCode(grpCode, code);
  }

}