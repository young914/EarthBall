package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;

import java.util.List;

public interface ConfirmService {

  int insertConfirm(ChConfirm chConfirm);

  int insertDetailInfo(ChDetailInfo chDetailInfo);

}
