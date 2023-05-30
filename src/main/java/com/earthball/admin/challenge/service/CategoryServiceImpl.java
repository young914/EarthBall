package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CategoryDto;
import com.earthball.admin.challenge.mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

  private final CategoryMapper categoryMapper;

  @Override
  public List<CategoryDto> selectCategoryList() {
    return categoryMapper.selectCategoryList();
  }

  @Transactional
  @Override
  public int insertCategory(String categoryName) {
    return categoryMapper.insertCategory(categoryName);
  }

  @Override
  public CategoryDto selectCategory(int categoryNo) {
    return categoryMapper.selectCategory(categoryNo);
  }

  @Transactional
  @Override
  public int updateCategory(CategoryDto categoryDto) {
    return categoryMapper.updateCategory(categoryDto);
  }

  @Transactional
  @Override
  public int deleteCategory(int categoryNo) {
    return categoryMapper.deleteCategory(categoryNo);
  }
}
