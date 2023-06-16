package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface BoConfirmService {

  int ConfirmListCount();

  List<BoConfirm> selectConfirmList(PageInfo pageInfo);
}
