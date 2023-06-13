package com.kh.earthball.bo.store.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.bo.store.mapper.AdminStoreMapper;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminStoreServiceImpl implements AdminStoreService {

  private final AdminStoreMapper storeMapper;

  @Transactional
  @Override
  public int insertStore(AdminStore p, ArrayList<AdminAtta> list) {
    int result1 = storeMapper.insertStore(p);

    int result2 = 0;

    for(AdminAtta at : list) {
      result2 = storeMapper.insertStoreAtta(at);
    }

    return result1 * result2;
  }

  @Override
  public ArrayList<AdminStore> adminAllStoreList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return storeMapper.adminAllStoreList(pi, rowBounds);
  }

  @Override
  public int selectListCount() {
    return storeMapper.selectListCount();
  }

}
