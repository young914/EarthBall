package com.earthball.admin.challenge.controller;

import java.util.List;

import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.dto.GrpCodeDto;
import com.earthball.admin.challenge.service.CodeService;
import com.earthball.admin.challenge.service.GrpCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CodeController {

  private final CodeService codeService;
  private final GrpCodeService grpCodeService;

  @GetMapping("codeEnrollForm")
  public String codeEnrollForm(String grpCode, Model model) {
//		log.info("grpCode 들어왔니? : " + grpCode);

    GrpCodeDto grp = grpCodeService.selectGrp(grpCode);

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
    GrpCodeDto selectGrp = grpCodeService.selectGrp(grpCode);

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
