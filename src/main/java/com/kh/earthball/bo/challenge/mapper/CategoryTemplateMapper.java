package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryTemplateMapper {
  List<CategoryTemplate> selectTemplateList(int categoryNo);

  int insertTemplate(CategoryTemplate template);
}
