package com.earthball.admin.categoryTemplate.service;

import com.earthball.admin.category.mapper.CategoryMapper;
import com.earthball.admin.categoryTemplate.mapper.CategoryTemplateMapper;
import com.earthball.admin.categoryTemplate.vo.CategoryTemplate;
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
