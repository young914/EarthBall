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

    return null;
  }

}
