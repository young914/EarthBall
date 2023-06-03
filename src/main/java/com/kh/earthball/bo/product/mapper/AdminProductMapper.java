package com.kh.earthball.bo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.bo.product.vo.Atta;
import com.kh.earthball.bo.product.vo.Product;
import com.kh.earthball.fo.common.vo.PageInfo;

@Mapper
public interface AdminProductMapper {

  int selectListCount();

  int insertProduct(Product p);

  int insertProductAtta(Atta at);

  ArrayList<Product> adminAllProductList(PageInfo pi, RowBounds rowBounds);



}
