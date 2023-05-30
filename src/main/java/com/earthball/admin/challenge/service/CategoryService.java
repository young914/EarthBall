package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CategoryDto;

import java.util.List;

public interface CategoryService {

  List<CategoryDto> selectCategoryList();

  int insertCategory(String categoryName);

  CategoryDto selectCategory(int categoryNo);

  int updateCategory(CategoryDto categoryDto);

  int deleteCategory(int categoryNo);


}
