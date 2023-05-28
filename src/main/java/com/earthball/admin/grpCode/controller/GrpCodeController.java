package com.earthball.admin.grpCode.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.earthball.admin.common.vo.PageInfo;
import com.earthball.admin.grpCode.service.GrpCodeService;
import com.earthball.admin.grpCode.vo.GrpCode;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class GrpCodeController {

	private final GrpCodeService grpCodeService;

	@GetMapping("grpCodeForm")
	public String insertGrpForm() {
		return "admin/grpCode/grpCodeEnrollForm";
	}

	@ResponseBody
	@PostMapping("insert.grp")
	public int insertGrp(GrpCode grpCode) {
		return grpCodeService.insertGrp(grpCode);
	}

	@GetMapping("list.grp")
	public String grpList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {

		int listCount = grpCodeService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;

		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<GrpCode> grpCodeList = grpCodeService.selectList(pi);

		log.info("grpCodeList : " + grpCodeList);

		model.addAttribute("pi", pi);
		model.addAttribute("grpCodeList", grpCodeList);

		return "admin/grpCode/grpCodeListView";
	}

	@GetMapping("updateForm.grp")
	public String updateGrpForm(@RequestParam(value="code") String code, Model model) {

		GrpCode grp = grpCodeService.selectGrp(code);

		model.addAttribute("grp", grp);

		return "admin/grpCode/grpCodeUpdateForm";
	}

	@ResponseBody
	@PostMapping("update.grp")
	public int updateGrp(GrpCode grpCode) {

		return grpCodeService.updateGrp(grpCode);
	}


	@GetMapping("deleteForm.grp")
	public String deleteGrp(Model model, @RequestParam(value="code") String code, HttpServletRequest request) {
		int result = grpCodeService.deleteGrp(code);

		if(result > 0) {	// 성공
			this.grpList(model, 1);
			return "admin/grpCode/grpCodeListView";
		} else {	// 실패
			String referer = request.getHeader("Referer");
		    return "redirect:" + referer;
		}
	}
}
