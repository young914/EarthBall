package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.vo.ChConReply;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface ConfirmService {

  void insertConfirm(ChConfirm chConfirm);
  void updateConfirm(ChConfirm chConfirm);
  int insertDetailInfo(ChDetailInfo chDetailInfo);

  int selectListCount(int chNo);

  List<ChConfirm> selectConfirmList(PageInfo pageInfo, int chNo);

  ChConfirm selectConfirm(int chConNo);

  List<ChDetailInfo> selectDetailInfoList(ChDetailInfoParam detailInfoParam);

  void deleteConfirm(ChConfirm chConfirm);

  int insertReply(ChConReply reply);

  List<ChConReply> selectReplyList(ChConReply reply);

}
