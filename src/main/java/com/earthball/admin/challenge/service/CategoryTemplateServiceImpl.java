package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.mapper.CategoryTemplateMapper;
import com.earthball.admin.challenge.dto.CategoryTemplateDto;
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
  public List<CategoryTemplateDto> selectTemplateList(int categoryNo) {
    return templateMapper.selectTemplateList(categoryNo);
  }

  @Override
  public int insertTemplate(CategoryTemplateDto template) {
    return templateMapper.insertTemplate(template);
  }
}
