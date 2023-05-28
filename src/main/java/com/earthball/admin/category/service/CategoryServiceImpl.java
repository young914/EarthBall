package com.earthball.admin.category.service;

import com.earthball.admin.category.mapper.CategoryMapper;
import com.earthball.admin.category.vo.Category;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{

    private final CategoryMapper categoryMapper;

    @Override
    public List<Category> selectCategoryList() {
        return categoryMapper.selectCategoryList();
    }

    @Transactional
    @Override
    public int insertCategory(String categoryName) {
        return categoryMapper.insertCategory(categoryName);
    }

    @Override
    public Category selectCategory(int categoryNo) {
        return categoryMapper.selectCategory(categoryNo);
    }

    @Transactional
    @Override
    public int updateCategory(Category category) {
        return categoryMapper.updateCategory(category);
    }

    @Transactional
    @Override
    public int deleteCategory(int categoryNo) {
        return categoryMapper.deleteCategory(categoryNo);
    }
}
