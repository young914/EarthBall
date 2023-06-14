package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ChallengeMapper;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChallengeServiceImpl implements ChallengeService {

  private final ChallengeMapper challengeMapper;

  @Override
  public int selectListCount() {
    return challengeMapper.selectListCount();
  }

  @Override
  public ArrayList<Challenge> selectList(PageInfo pageInfo) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = pageInfo.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return challengeMapper.selectList(rowBounds);
  }

  @Override
  @Transactional  // 모든 값들이 다 적용 된 후에 커밋 처리 될 수 있도록 묶어두는 개념
  public int requestChallenge(Challenge challenge) {
    challenge.setChStartDay(challenge.getChStartDay().replaceAll("-", ""));
    challenge.setChEndDay(challenge.getChEndDay().replaceAll("-", ""));
    int result = challengeMapper.requestChallenge(challenge);
    if (result == 0) {
      throw new RuntimeException();
    }
    return result;
  }

  @Override
  public Challenge selectChallenge(int chNo) {
    return challengeMapper.selectChallenge(chNo);
  }

  @Override
  public int challengeUpdate(Challenge challenge) {
    challenge.setChStartDay(challenge.getChStartDay().replaceAll("-", ""));
    challenge.setChEndDay(challenge.getChEndDay().replaceAll("-", ""));

    int result = challengeMapper.challengeUpdate(challenge);
    if (result == 0) {
      throw new RuntimeException();
    }
    return result;
  }

  @Override
  public int challengeDelete(int chNo) {
    return challengeMapper.challengeDelete(chNo);
  }

  @Override
  public int selectCategoryListCount(int categoryNo) {
    return challengeMapper.selectCategoryListCount(categoryNo);
  }

  @Override
  public ArrayList<Challenge> selectCategoryList(PageInfo pageInfo, int categoryNo) {
    log.info("서비스임플인데, pageInfo : " + pageInfo);
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    log.info("offset : " + offset);
    log.info("limit : " + limit);

    ArrayList<Challenge> list = challengeMapper.selectCategoryList(offset, limit, categoryNo);

    log.info("쿼리문 건너온 list : " + list);
    return list;
  }
}
