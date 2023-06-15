package com.kh.earthball.fo.point.service;

import org.springframework.stereotype.Service;
import com.kh.earthball.fo.point.mapper.PointMapper;
import com.kh.earthball.fo.point.vo.Point;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class PointServiceImpl implements PointService {

  private final PointMapper pointMapper;

  @Override
  public int insertPoint(Point p) {

    return pointMapper.insertPoint(p);
  }

  @Override
  public int addMemberPoint(Point p) {

    return pointMapper.addMemberPoint(p);
  }

}
