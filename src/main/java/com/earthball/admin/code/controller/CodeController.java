package com.earthball.admin.code.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.earthball.admin.code.service.CodeService;
import com.earthball.admin.code.vo.Code;
import com.earthball.admin.grpCode.service.GrpCodeService;
import com.earthball.admin.grpCode.vo.GrpCode;

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

		GrpCode grp = grpCodeService.selectGrp(grpCode);

		model.addAttribute("grp", grp);

		return "admin/code/codeEnrollForm";
	}

	@ResponseBody
	@PostMapping("insert.code")
	public int insertCode(Code code) {
//		log.info("Code : " + code);
		int result = codeService.insertCode(code);
//		log.info("result : " + result);
		return result;
	}

	@GetMapping("list.code")
	public String selectListCode(Model model, @RequestParam(value="grpCode") String grpCode) {

		List<Code> codeList = codeService.selectCodeList(grpCode);

		model.addAttribute("codeList", codeList);

		return "admin/code/codeListView";
	}

	@GetMapping("updateForm.code")
	public String codeUpdateForm(@RequestParam(value="grpCode") String grpCode, @RequestParam(value="code") String code, Model model) {

		log.info("값 들어옴? : " + grpCode + code);

		// 코드 정보 조회해와야지
		Code selectCode = codeService.selectCode(grpCode, code);
		GrpCode selectGrp = grpCodeService.selectGrp(grpCode);

		model.addAttribute("code", selectCode);
		model.addAttribute("grp", selectGrp);

		return "admin/code/codeUpdateForm";
	}

	@ResponseBody
	@PostMapping("update.code")
	public int updateCode(Code code) {

		log.info("업데이트 코드 들어와라 : " + code);

		int result = codeService.updateCode(code);

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
