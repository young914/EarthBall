package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ConfirmMapper;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService{

  private final ConfirmMapper confirmMapper;

  @Override
  public int insertConfirm(ChConfirm chConfirm) {
    return confirmMapper.insertConfirm(chConfirm);
  }

  @Override
  public int insertDetailInfo(ChDetailInfo chDetailInfo) {
    return confirmMapper.insertDetailInfo(chDetailInfo);
  }

}
