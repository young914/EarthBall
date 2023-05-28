package com.earthball.admin.category.service;

import com.earthball.admin.category.mapper.CategoryMapper;
import com.earthball.admin.category.vo.Category;
import com.earthball.admin.code.vo.Code;

import java.util.List;

public interface CategoryService {

    List<Category> selectCategoryList();

    int insertCategory(String categoryName);

    Category selectCategory(int categoryNo);

    int updateCategory(Category category);

    int deleteCategory(int categoryNo);


}
