package com.kh.earthball.fo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.bo.product.vo.Product;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface ProductMapper {

  int selectListCount();

  ArrayList<Product> selectAllProduct(@Param("offset") int offset, @Param("limit") int limit);

  int selectCategoryListCount(String category);

  ArrayList<Product> selectCategoryProduct(@Param("offset") int offset, @Param("limit") int limit, @Param("category") String category);

}
