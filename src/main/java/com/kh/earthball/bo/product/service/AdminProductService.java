package com.kh.earthball.bo.product.service;

import java.util.ArrayList;
import com.kh.earthball.bo.product.vo.Atta;
import com.kh.earthball.bo.product.vo.Product;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface AdminProductService {

  int selectListCount();

  int insertProduct(Product p, ArrayList<Atta> list);

  ArrayList<Product> adminAllProductList(PageInfo pi);



}
