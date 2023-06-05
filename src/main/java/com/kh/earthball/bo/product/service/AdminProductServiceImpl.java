package com.kh.earthball.bo.product.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.bo.product.mapper.AdminProductMapper;
import com.kh.earthball.bo.product.vo.AdminAtta;
import com.kh.earthball.bo.product.vo.AdminProduct;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminProductServiceImpl implements AdminProductService {

  private final AdminProductMapper productMapper;

  @Transactional
  @Override
  public int insertProduct(AdminProduct p, ArrayList<AdminAtta> list) {
    int result1 = productMapper.insertProduct(p);

    int result2 = 0;

    for(AdminAtta at : list) {
      result2 = productMapper.insertProductAtta(at);
    }

    return result1 * result2;
  }

  @Override
  public ArrayList<AdminProduct> adminAllProductList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return productMapper.adminAllProductList(pi, rowBounds);
  }

  @Override
  public int selectListCount() {
    return productMapper.selectListCount();
  }

}
