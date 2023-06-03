package com.kh.earthball.fo.challenge.mapper;

import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChallengeMapper {

  int requestChallenge(Challenge challenge);

  int insertChDetailInfo(ChDetailInfo chDetailInfo);
}
