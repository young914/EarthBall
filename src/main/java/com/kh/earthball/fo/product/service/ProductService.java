package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import com.kh.earthball.bo.product.vo.Atta;
import com.kh.earthball.bo.product.vo.Product;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface ProductService {

  ArrayList<Product> selectAllProduct(PageInfo pi);

  int selectListCount();

  int selectCategoryListCount(String category);

  ArrayList<Product> selectCategoryProduct(PageInfo pi, String category);

}
