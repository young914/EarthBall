package com.earthball.member.challenge.service;

import com.earthball.member.challenge.dto.ChallengeDto;
import com.earthball.member.challenge.mapper.ChallengeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChallengeServiceImpl implements ChallengeService {

  private final ChallengeMapper challengeMapper;

  @Override
  public int requestChallenge(ChallengeDto challengeDto) {
    return challengeMapper.requestChallenge(challengeDto);
  }
}
