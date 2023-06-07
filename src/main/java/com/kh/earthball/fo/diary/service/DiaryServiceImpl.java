package com.kh.earthball.fo.diary.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.mapper.DiaryMapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.diary.vo.Diary;
import com.kh.earthball.fo.diary.vo.DyReply;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class DiaryServiceImpl  implements DiaryService {

  public final DiaryMapper diaryMapper;

  @Override
   public int selectListCount() {
       return diaryMapper.selectListCount();
  }

  @Override
  public ArrayList<Diary> selectList(PageInfo pi) {
    return diaryMapper.selectList( pi);
  }

  public List<Diary> getDiarys(int offset, int limit) {
    return diaryMapper.selectDiarys(new RowBounds(offset, limit));
}

  @Override
  public int insertDiary(Diary d) {
    return diaryMapper.insertDiary(d);

  }

  @Override
  public int increaseCount(int dyBoardNo) {
    // return diaryMapper.increaseCount(dyBoardNo);
    return 0;
  }

  @Override
  public Diary selectDiary(int dyBoardNo) {
    // return diaryMapper.selectDiary(dyBoardNo);
    return null;
  }

  @Override
  public int deleteDiary(int dyBoardNo) {
    // return diaryMapper.deleteDiary(dyBoardNo);
    return 0;
  }

  @Override
  public int updateDiary(Diary d) {
    // return diaryMapper.deleteDiary(d);
    return 0;
  }

  @Override
  public ArrayList<DyReply> selectDyReplyList(int dyBoardNo) {
    return null;
  }

  @Override
  public int insertDyReply(DyReply r) {
    return 0;
  }


}
