package com.earthball.admin.challenge.mapper;

import com.earthball.admin.challenge.dto.CategoryTemplateDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryTemplateMapper {
  List<CategoryTemplateDto> selectTemplateList(int categoryNo);

  int insertTemplate(CategoryTemplateDto template);
}
