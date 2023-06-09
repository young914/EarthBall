package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ConfirmMapper;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService {

  private final ConfirmMapper confirmMapper;

  @Override
  public void insertConfirm(ChConfirm chConfirm) {
    confirmMapper.insertConfirm(chConfirm);

    List<ChDetailInfo> chDetailInfoList = chConfirm.getChDetailInfoList();

    for (ChDetailInfo chDetailInfo : chDetailInfoList) {
      chDetailInfo.setChConNo(chConfirm.getChConNo());
      chDetailInfo.setChNo(chConfirm.getChNo());

      log.info("디테일 객체 하나 : " + chDetailInfo);
      confirmMapper.insertDetailInfo(chDetailInfo);
    }
  }


  @Override
  public void updateConfirm(ChConfirm chConfirm) {
    confirmMapper.updateConfirm(chConfirm);

    confirmMapper.deleteDetailInfo(chConfirm);
    List<ChDetailInfo> chDetailInfoList = chConfirm.getChDetailInfoList();

    for (ChDetailInfo chDetailInfo : chDetailInfoList) {
      chDetailInfo.setChConNo(chConfirm.getChConNo());
      chDetailInfo.setChNo(chConfirm.getChNo());

      log.info("디테일 객체 하나 : " + chDetailInfo);
      confirmMapper.insertDetailInfo(chDetailInfo);
    }
  }
  @Override
  public int insertDetailInfo(ChDetailInfo chDetailInfo) {
    return confirmMapper.insertDetailInfo(chDetailInfo);
  }

  @Override
  public int selectListCount(int chNo) {
    return confirmMapper.selectListCount(chNo);
  }

  @Override
  public List<ChConfirm> selectConfirmList(PageInfo pageInfo, int chNo) {
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    return confirmMapper.selectConfirmList(offset, limit, chNo);
  }

  @Override
  public ChConfirm selectConfirm(int chConNo) {
    return confirmMapper.selectConfirm(chConNo);
  }


  @Override
  public List<ChDetailInfo> selectDetailInfoList(ChDetailInfoParam detailInfoParam) {
    return confirmMapper.selectDetailInfoList(detailInfoParam);
  }

}
