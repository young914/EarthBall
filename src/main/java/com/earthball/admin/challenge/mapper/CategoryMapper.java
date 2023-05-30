package com.earthball.admin.challenge.mapper;

import com.earthball.admin.challenge.dto.CategoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
  List<CategoryDto> selectCategoryList();

  int insertCategory(String categoryName);

  CategoryDto selectCategory(int categoryNo);

  int updateCategory(CategoryDto categoryDto);

  int deleteCategory(int categoryNo);

}
