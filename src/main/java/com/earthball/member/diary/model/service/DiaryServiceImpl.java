package com.earthball.member.diary.model.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.earthball.common.vo.PageInfo;
import com.earthball.member.diary.model.vo.Diary;
import com.earthball.member.diary.model.vo.DyReply;

@Service
public class DiaryServiceImpl implements DiaryService {

          @Override
          public int selectListCount() {
            // TODO Auto-generated method stub
            return 0;
          }
        
          @Override
          public ArrayList<Diary> selectList(PageInfo pi) {
            // TODO Auto-generated method stub
            return null;
          }
        
          @Override
          public int insertDiary(Diary d) {
            // TODO Auto-generated method stub
            return 0;
          }
        
          @Override
          public int increaseCount(int dyBoardNo) {
            // TODO Auto-generated method stub
            return 0;
          }
        
          @Override
          public Diary selectDiary(int dyBoardNo) {
            // TODO Auto-generated method stub
            return null;
          }
        
          @Override
          public int deleteDiary(int dyBoardNo) {
            // TODO Auto-generated method stub
            return 0;
          }
        
          @Override
          public int updateDiary(Diary d) {
            // TODO Auto-generated method stub
            return 0;
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
