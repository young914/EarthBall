package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.fo.product.mapper.ReviewMapper;
import com.kh.earthball.fo.product.vo.Review;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

  private final ReviewMapper reviewMapper;

  @Transactional
  @Override
  public int insertReview(Review r) {
    return reviewMapper.insertReview(r);
  }

  @Override
  public ArrayList<Review> selectList(int productNo) {
    return reviewMapper.selectList(productNo);
  }



}
