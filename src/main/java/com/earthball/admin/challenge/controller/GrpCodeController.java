package com.earthball.admin.challenge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.admin.challenge.service.GrpCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.earthball.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class GrpCodeController {

  private final GrpCodeService grpCodeService;

  @GetMapping("grpCodeForm")
  public String insertGrpForm() {
    return "admin/challenge/grpCode/grpCodeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.grp")
  public int insertGrp(GrpCodeDto grpCodeDto) {
    return grpCodeService.insertGrp(grpCodeDto);
  }

  @GetMapping("list.grp")
  public String grpList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

    int listCount = grpCodeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    int maxPage = (int) Math.ceil((double) listCount / boardLimit);
    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    int endPage = startPage + pageLimit - 1;

    if (endPage > maxPage) {
      endPage = maxPage;
    }

    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

    List<GrpCodeDto> grpCodeDtoList = grpCodeService.selectList(pi);

    log.info("grpCodeList : " + grpCodeDtoList);

    model.addAttribute("pi", pi);
    model.addAttribute("grpCodeList", grpCodeDtoList);

    return "admin/challenge/grpCode/grpCodeListView";
  }

  @GetMapping("updateForm.grp")
  public String updateGrpForm(@RequestParam(value = "code") String code, Model model) {

    GrpCodeDto grp = grpCodeService.selectGrp(code);

    model.addAttribute("grp", grp);

    return "admin/challenge/grpCode/grpCodeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.grp")
  public int updateGrp(GrpCodeDto grpCodeDto) {

    return grpCodeService.updateGrp(grpCodeDto);
  }


  @GetMapping("deleteForm.grp")
  public String deleteGrp(Model model, @RequestParam(value = "code") String code, HttpServletRequest request) {
    int result = grpCodeService.deleteGrp(code);

    if (result > 0) {  // 성공
      this.grpList(model, 1);
      return "admin/challenge/grpCode/grpCodeListView";
    } else {  // 실패
      String referer = request.getHeader("Referer");
      return "redirect:" + referer;
    }
  }
}
