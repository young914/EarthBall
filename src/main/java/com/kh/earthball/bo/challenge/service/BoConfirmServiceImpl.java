package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.BoConfirmMapper;
import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoConfirmServiceImpl implements BoConfirmService{

  private final BoConfirmMapper boConfirmMapper;

  @Override
  public int ConfirmListCount() {
    return boConfirmMapper.ConfirmListCount();
  }

  @Override
  public List<BoConfirm> selectConfirmList(PageInfo pageInfo) {
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    return boConfirmMapper.selectConfirmList(offset, limit);
  }

  @Override
  public BoConfirm selectConfirm(int chConNo) {

    return boConfirmMapper.selectConfirm(chConNo);
  }

  @Override
  public void deleteConfirm(BoConfirm boConfirm) {
    boConfirmMapper.deleteConfirm(boConfirm);
    boConfirmMapper.deleteDetailInfo(boConfirm);
  }
}
