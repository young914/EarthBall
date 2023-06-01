package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
  List<Category> selectCategoryList();

  int insertCategory(String categoryName);

  Category selectCategory(int categoryNo);

  int updateCategory(Category category);

  int deleteCategory(int categoryNo);

}
