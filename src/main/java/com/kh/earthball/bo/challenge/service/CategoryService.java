package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.Code;

import java.util.List;

public interface CategoryService {

  List<Category> selectCategoryList();

  int insertCategory(String categoryName);

  Category selectCategory(int categoryNo);

  int updateCategory(Category category);

  int deleteCategory(int categoryNo);

  //String selectGrpCode(String categoryName);

  List<Code> selectCodeList(String categoryName);

}
