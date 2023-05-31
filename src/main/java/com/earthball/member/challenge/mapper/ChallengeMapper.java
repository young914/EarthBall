package com.earthball.member.challenge.mapper;

import com.earthball.member.challenge.dto.ChallengeDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChallengeMapper {

  int requestChallenge(ChallengeDto challengeDto);

}
