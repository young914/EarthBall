package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface ConfirmService {

  int insertConfirm(ChConfirm chConfirm);

  int insertDetailInfo(ChDetailInfo chDetailInfo);

  int selectListCount(int chNo);

  List<ChConfirm> selectConfirmList(PageInfo pageInfo, int chNo);

}
