package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ChallengeMapper;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChallengeServiceImpl implements ChallengeService {

  private final ChallengeMapper challengeMapper;

  @Override
  @Transactional  // 모든 값들이 다 적용 된 후에 커밋 처리 될 수 있도록 묶어두는 개념
  public int requestChallenge(Challenge challenge) {
    challenge.setChStartDay(challenge.getChStartDay().replaceAll("-", ""));
    challenge.setChEndDay(challenge.getChEndDay().replaceAll("-", ""));
    challenge.setMemberId("user02");
    int reulst = challengeMapper.requestChallenge(challenge);
    if (reulst == 0) {
      throw new RuntimeException();
    }

    for (ChDetailInfo chDetailInfo : challenge.getList()) {
      chDetailInfo.setChNo(challenge.getChNo());
      challengeMapper.insertChDetailInfo(chDetailInfo);
    }
    return reulst;
  }
}
