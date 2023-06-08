package com.kh.earthball.fo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.product.vo.Atta;
import com.kh.earthball.fo.product.vo.Product;

public interface ProductMapper {

  int selectListCount();

  ArrayList<Product> selectAllProduct(@Param("offset") int offset, @Param("limit") int limit);

  int selectCategoryListCount(String category);

  ArrayList<Product> selectCategoryProduct(@Param("offset") int offset, @Param("limit") int limit, @Param("category") String category);

  Product selectProduct(int productNo);

  ArrayList<Atta> selectAtta(int productNo);

}
