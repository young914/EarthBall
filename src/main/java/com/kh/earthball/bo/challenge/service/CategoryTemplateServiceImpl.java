package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.CategoryTemplateMapper;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CategoryTemplateServiceImpl implements CategoryTemplateService {

  private final CategoryTemplateMapper templateMapper;

  @Override
  public List<CategoryTemplate> selectTemplateList(int categoryNo) {
    return templateMapper.selectTemplateList(categoryNo);
  }

  @Override
  public int insertTemplate(CategoryTemplate template) {
    return templateMapper.insertTemplate(template);
  }
}
