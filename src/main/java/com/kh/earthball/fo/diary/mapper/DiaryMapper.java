package com.kh.earthball.fo.diary.mapper;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.vo.Diary;

@Mapper
public interface DiaryMapper {

      int selectListCount();

      ArrayList<Diary> selectList(PageInfo pi);

      List<Diary> selectDiarys(RowBounds rowBounds);

      int insertDiary(Diary d);
}

