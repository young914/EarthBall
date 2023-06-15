package com.kh.earthball.fo.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.fo.point.service.PointService;
import com.kh.earthball.fo.point.vo.Point;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class PointController {

  private final PointService pointService;

  @ResponseBody
  @PostMapping("/insertPoint")
  public String insertPoint(Point p) {

    int result1 = pointService.insertPoint(p);
    
    int result2 = 0;

    if(result1 == 1) {

      result2 = pointService.addMemberPoint(p);

    }
    
    int result = (result1 * result2);

    return String.valueOf(result);// 1 = 성공, 0 = 실패
  }

}