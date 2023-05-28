package com.earthball.admin.categoryTemplate.mapper;

import com.earthball.admin.categoryTemplate.vo.CategoryTemplate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryTemplateMapper {
    List<CategoryTemplate> selectTemplateList(int categoryNo);

    int insertTemplate(CategoryTemplate template);
}
