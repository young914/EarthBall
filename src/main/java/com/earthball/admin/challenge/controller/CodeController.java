package com.earthball.admin.challenge.controller;

import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.admin.challenge.service.CodeService;
import com.earthball.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CodeController {

  private final CodeService codeService;

  @GetMapping("grpCodeForm")
  public String insertGrpForm() {
    return "admin/challenge/code/grpCodeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.grp")
  public int insertGrp(GrpCodeDto grpCodeDto) {
    return codeService.insertGrp(grpCodeDto);
  }

  @GetMapping("list.grp")
  public String grpList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

    int listCount = codeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    int maxPage = (int) Math.ceil((double) listCount / boardLimit);
    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    int endPage = startPage + pageLimit - 1;

    if (endPage > maxPage) {
      endPage = maxPage;
    }

    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

    List<GrpCodeDto> grpCodeDtoList = codeService.selectList(pi);

    log.info("grpCodeList : " + grpCodeDtoList);

    model.addAttribute("pi", pi);
    model.addAttribute("grpCodeList", grpCodeDtoList);

    return "admin/challenge/code/grpCodeListView_2";
  }

  @GetMapping("updateForm.grp")
  public String updateGrpForm(@RequestParam(value = "code") String code, Model model) {

    GrpCodeDto grp = codeService.selectGrp(code);

    model.addAttribute("grp", grp);

    return "admin/challenge/code/grpCodeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.grp")
  public int updateGrp(GrpCodeDto grpCodeDto) {

    return codeService.updateGrp(grpCodeDto);
  }


  @GetMapping("deleteForm.grp")
  public String deleteGrp(Model model, @RequestParam(value = "code") String code, HttpServletRequest request) {
    int result = codeService.deleteGrp(code);

    if (result > 0) {  // 성공
      this.grpList(model, 1);
      return "admin/challenge/code/grpCodeListView";
    } else {  // 실패
      String referer = request.getHeader("Referer");
      return "redirect:" + referer;
    }
  }

  @GetMapping("codeEnrollForm")
  public String codeEnrollForm(String grpCode, Model model) {
//		log.info("grpCode 들어왔니? : " + grpCode);

    GrpCodeDto grp = codeService.selectGrp(grpCode);

    model.addAttribute("grp", grp);

    return "admin/challenge/code/codeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.code")
  public int insertCode(CodeDto codeDto) {
//		log.info("Code : " + code);
    int result = codeService.insertCode(codeDto);
//		log.info("result : " + result);
    return result;
  }

  @GetMapping("list.code")
  public String selectListCode(Model model, @RequestParam(value = "grpCode") String grpCode) {

    List<CodeDto> codeDtoList = codeService.selectCodeList(grpCode);

    model.addAttribute("codeList", codeDtoList);

    return "admin/challenge/code/codeListView";
  }

  @GetMapping("updateForm.code")
  public String codeUpdateForm(@RequestParam(value = "grpCode") String grpCode, @RequestParam(value = "code") String code, Model model) {

    log.info("값 들어옴? : " + grpCode + code);

    // 코드 정보 조회해와야지
    CodeDto selectCodeDto = codeService.selectCode(grpCode, code);
    GrpCodeDto selectGrp = codeService.selectGrp(grpCode);

    model.addAttribute("code", selectCodeDto);
    model.addAttribute("grp", selectGrp);

    return "admin/challenge/code/codeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.code")
  public int updateCode(CodeDto codeDto) {

    log.info("업데이트 코드 들어와라 : " + codeDto);

    int result = codeService.updateCode(codeDto);

    log.info("업데이트 결과 : " + result);

    return result;
  }


  @ResponseBody
  @PostMapping("delete.code")
  public int deleteCode(String grpCode, String code) {
    int result = codeService.deleteCode(grpCode, code);

    log.info("삭제 result 값 : " + result);

    return result;
  }

}
