package com.kh.earthball.fo.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.service.DiaryService;
import com.kh.earthball.fo.diary.vo.Diary;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RequiredArgsConstructor
@Slf4j
@Controller
public class DiaryController {


  private final DiaryService diaryService;

  @RequestMapping("diaryListView.bo")
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage,
                                   Model model) {

    // System.out.println("cPage : " + currentPage);

    // 페이징 처리를 위한 PageInfo 객체 얻어내기
     int listCount = diaryService.selectListCount();

      int pageLimit = 5;
      int boardLimit = 6;

      // Pagination 에 작성한 getPageInfo 메소드 호출
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
      // System.out.println(pi);

      // 목록을 조회하는 요청
      ArrayList<Diary> list = diaryService.selectList(pi);

      // System.out.println(list);

      // 응답데이터를 model 에 담기
      model.addAttribute("pi", pi);
      model.addAttribute("list", list);

      // 포워딩
      return "fo/diary/diaryListView";
  }

  @RequestMapping("diaryEnrollForm.bo")
  public String diaryEnrollForm() {
    return "fo/diary/diaryEnrollForm";
  }

  /*
  @PostMapping("/diaryInsert.bo")
  public String insertDiary(@ModelAttribute Diary d,
                                  @RequestParam("file")  MultipartFile file,
                                  HttpSession session,
                                  Model model) {

    System.out.println(d);
    System.out.println(file);
    System.out.println("dyBoardTitle: " + d.getDyBoardTitle());

    // 전달된 파일이 있을 경우 그 경우에만 파일명 수정 작업 후 서버로 업로드 할 수 있게 로직 짜기
    if(file.getOriginalFilename().equals("")) { // 넘어온 첨부파일이 있을 경우

        String changeName = saveFile(file, session);

      // 원본파일명, 서버에 업로드된경로 + 수정파일명을 Diary d 에 담기
      d.setOriginName(file.getOriginalFilename());
      d.setChangeName("resources/fo/upfiles/" + changeName);
      }

    int result = diaryService.insertDiary(d);

    if(result > 0) { // 성공
        session.setAttribute("alertMsg", "게시글 등록 완료");

        return "redirect:/diaryListView.bo"; // 내부적으로 1번 페이지로 향함

    } else { // 실패
        model.addAttribute("errorMsg", "게시글 등록 실패");

        return "redirect:/diaryEnrollForm.bo";
    }
   }

      // 현재 넘어온 첨부파일 그 자체를 파일명 수정 후 서버의 폴더에 저장시키는 일반 메소드 작성
      public String saveFile(MultipartFile file, HttpSession session) {

        String originName = file.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        int ranNum = (int)(Math.random() * 90000 + 100000);

        String ext = originName.substring(originName.lastIndexOf("."));

        String changeName = currentTime + ranNum + ext;

        String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");

        try {
              file.transferTo(new File(savePath + changeName));
        } catch (IOException e) {
              e.printStackTrace();
        }

        return changeName;
      }
  */

  @PostMapping("/diaryInsert.bo")
  public String insertDiary(@ModelAttribute Diary diary, HttpSession session, Model model, @RequestParam(value="file", required=true) MultipartFile file) {

    System.out.println("잘호출되나?");

    System.out.println(diary);
    System.out.println(file);

      String title = diary.getDyBoardTitle();
      String content = diary.getDyBoardContent();

      if(!file.getOriginalFilename().isEmpty() && !title.isEmpty() && !content.isEmpty()) {
        String changeName = saveFile(file, session);
        diary.setOriginName(file.getOriginalFilename());
        diary.setChangeName("resources/fo/upfiles/" + changeName);
        System.out.println(diary.getChangeName());

        int result = diaryService.insertDiary(diary);

        if(result > 0) {
            session.setAttribute("alertMsg", "게시글 등록 완료");
            return "redirect:/diaryListView.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 등록 실패");
            return "redirect:/diaryEnrollForm.bo";
        }
    }

    // 필요한 데이터가 누락된 경우
    model.addAttribute("errorMsg", "누락된 데이터가 있습니다");
    return "redirect:/diaryEnrollForm.bo";
}

  private String saveFile(MultipartFile file, HttpSession session) {

      String originName = file.getOriginalFilename();
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

      int ranNum = (int)(Math.random() * 90000 + 10000);

      String ext = originName.substring(originName.lastIndexOf("."));

      String changeName = currentTime + ranNum + ext;

      String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");

      try {
            file.transferTo(new File(savePath + changeName));
      } catch (IOException e) {
            e.printStackTrace();
      }

      return changeName;
    }


}



