package com.earthball.admin.category.mapper;

import com.earthball.admin.category.vo.Category;
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
