package com.kh.earthball.fo.challenge.mapper;

import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ChallengeMapper {

  int selectListCount();

  int requestChallenge(Challenge challenge);

  int insertChDetailInfo(ChDetailInfo chDetailInfo);

  ArrayList<Challenge> selectList(RowBounds rowBounds);

  Challenge selectChallenge(int chNo);

  int challengeUpdate(Challenge challenge);

  int challengeDelete(int chNo);

  int selectCategoryListCount(int categoryNo);

  ArrayList<Challenge> selectCategoryList(@Param("offset") int offset, @Param("limit") int limit, @Param("categoryNo") int categoryNo);

  int selectStatListCount(String chStatName);

  ArrayList<Challenge> selectStatList(@Param("offset") int offset, @Param("limit") int limit, @Param("chStatName") String chStatName);

  List<Challenge> mainChallengeList();

}
