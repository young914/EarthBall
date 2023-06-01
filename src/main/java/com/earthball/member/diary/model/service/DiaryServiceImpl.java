package com.earthball.member.diary.model.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.diary.mapper.DiaryMapper;
import com.earthball.member.diary.model.vo.Diary;
import com.earthball.member.diary.model.vo.DyReply;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class DiaryServiceImpl implements DiaryService {

        public final DiaryMapper diaryMapper;

          @Override
          public int selectListCount() {
                return diaryMapper.selectListCount();
          }

          @Override
          public ArrayList<Diary> selectList(PageInfo pi) {
            return diaryMapper.selectList(pi);
          }

          @Override
          public int insertDiary(Diary d) {
            return diaryMapper.insertDiary(d);
          }

          @Override
          public int increaseCount(int dyBoardNo) {
            return diaryMapper.increaseCount(dyBoardNo);
          }

          @Override
          public Diary selectDiary(int dyBoardNo) {
            return diaryMapper.selectDiary(dyBoardNo);
          }

          @Override
          public int deleteDiary(int dyBoardNo) {
             return diaryMapper.deleteDiary(dyBoardNo);
          }

          @Override
          public int updateDiary(Diary d) {
            return diaryMapper.deleteDiary(d);
          }

          @Override
          public ArrayList<DyReply> selectDyReplyList(int dyBoardNo) {
            // TODO Auto-generated method stub
            return null;
          }

          @Override
          public int insertDyReply(DyReply r) {
            // TODO Auto-generated method stub
            return 0;
          }

        }
