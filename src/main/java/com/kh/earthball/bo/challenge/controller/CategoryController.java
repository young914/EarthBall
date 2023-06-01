package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
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
    List<Category> categoryList = categoryService.selectCategoryList();

    log.info("categoryList에 뭐 들음? : " + categoryList);

    model.addAttribute("categoryList", categoryList);

    return "bo/challenge/category/categoryListView";
  }


  @GetMapping("EnrollForm.ca")
  public String insertCategoryForm() {
    return "bo/challenge/category/categoryEnrollForm";
  }


  @ResponseBody
  @PostMapping("insert.ca")
  public int insertCategory(String categoryName) {
    return categoryService.insertCategory(categoryName);
  }


  @GetMapping("updateForm.ca")
  public String updateCategoryForm(@RequestParam(value = "categoryNo") int categoryNo, Model model) {
    Category category = categoryService.selectCategory(categoryNo);

    log.info("수정할 카테고리 : " + category);

    model.addAttribute("category", category);
    return "bo/challenge/category/categoryUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.ca")
  public int updateCategory(Category category) {
    log.info("수정할 카테고리정보 : " + category);
    int result = categoryService.updateCategory(category);
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

    List<CategoryTemplate> templateList = templateService.selectTemplateList(categoryNo);
    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("templateList", templateList);
    model.addAttribute("category", category);

    return "bo/challenge/category/categoryDetailView";
  }
}
