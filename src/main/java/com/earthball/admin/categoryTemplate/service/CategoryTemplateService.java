package com.earthball.admin.categoryTemplate.service;

import com.earthball.admin.categoryTemplate.vo.CategoryTemplate;

import java.util.List;

public interface CategoryTemplateService {

    List<CategoryTemplate> selectTemplateList(int categoryNo);

    int insertTemplate(CategoryTemplate template);
}
