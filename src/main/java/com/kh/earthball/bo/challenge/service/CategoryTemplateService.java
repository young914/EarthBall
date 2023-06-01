package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.CategoryTemplate;

import java.util.List;

public interface CategoryTemplateService {

  List<CategoryTemplate> selectTemplateList(int categoryNo);

  int insertTemplate(CategoryTemplate template);
}
