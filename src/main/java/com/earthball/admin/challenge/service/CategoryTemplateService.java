package com.earthball.admin.challenge.service;

import com.earthball.admin.challenge.dto.CategoryTemplateDto;

import java.util.List;

public interface CategoryTemplateService {

  List<CategoryTemplateDto> selectTemplateList(int categoryNo);

  int insertTemplate(CategoryTemplateDto template);
}
