package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ChallengeMapper;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChallengeServiceImpl implements ChallengeService {

  private final ChallengeMapper challengeMapper;

  @Override
  public int requestChallenge(Challenge challenge) {
    return challengeMapper.requestChallenge(challenge);
  }
}
