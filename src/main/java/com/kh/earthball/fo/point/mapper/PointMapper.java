package com.kh.earthball.fo.point.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.kh.earthball.fo.point.vo.Point;

@Mapper
public interface PointMapper {

  int insertPoint(Point p);

  int plusMemberPoint(Point p);

  int minusMemberPoint(Point p);

}
