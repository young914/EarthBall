package com.earthball.admin.challenge.controller;

import com.earthball.admin.challenge.dto.CategoryDto;
import com.earthball.admin.challenge.service.CategoryService;
import com.earthball.admin.challenge.service.CategoryTemplateService;
import com.earthball.admin.challenge.dto.CategoryTemplateDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
public class CategoryController {

  private final CategoryService categoryService;
  private final CategoryTemplateService templateService;

  @GetMapping("list.ca")
  public String selectListCategory(Model model) {
    List<CategoryDto> categoryDtoList = categoryService.selectCategoryList();

    log.info("categoryList에 뭐 들음? : " + categoryDtoList);

    model.addAttribute("categoryList", categoryDtoList);

    return "admin/challenge/category/categoryListView";
  }


  @GetMapping("EnrollForm.ca")
  public String insertCategoryForm() {
    return "admin/challenge/category/categoryEnrollForm";
  }


  @ResponseBody
  @PostMapping("insert.ca")
  public int insertCategory(String categoryName) {
    return categoryService.insertCategory(categoryName);
  }


  @GetMapping("updateForm.ca")
  public String updateCategoryForm(@RequestParam(value = "categoryNo") int categoryNo, Model model) {
    CategoryDto categoryDto = categoryService.selectCategory(categoryNo);

    log.info("수정할 카테고리 : " + categoryDto);

    model.addAttribute("category", categoryDto);
    return "admin/challenge/category/categoryUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.ca")
  public int updateCategory(CategoryDto categoryDto) {
    log.info("수정할 카테고리정보 : " + categoryDto);
    int result = categoryService.updateCategory(categoryDto);
    log.info("카테고리 수정결과? : " + result);
    return result;
  }

  @ResponseBody
  @PostMapping("delete.ca")
  public int deleteCategory(int categoryNo) {
    return categoryService.deleteCategory(categoryNo);
  }


  @GetMapping("detail.ca")
  public String categoryDetailView(int categoryNo, Model model) {

    List<CategoryTemplateDto> templateList = templateService.selectTemplateList(categoryNo);
    CategoryDto categoryDto = categoryService.selectCategory(categoryNo);

    model.addAttribute("templateList", templateList);
    model.addAttribute("category", categoryDto);

    return "admin/challenge/category/categoryDetailView";
  }
}
