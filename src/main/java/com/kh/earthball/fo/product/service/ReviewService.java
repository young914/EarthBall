package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import com.kh.earthball.fo.product.vo.Review;

public interface ReviewService {

  int insertReview(Review r);

  ArrayList<Review> selectList(int productNo);

}
