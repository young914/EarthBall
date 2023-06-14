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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
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

       System.out.println(list);

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

  @ResponseBody
  @RequestMapping(value="/diaryInsert.bo", produces="text/html; charset=UTF-8")
  public String insertDiary(String weather, @ModelAttribute Diary diary, HttpSession session, @RequestParam(value="file", required=true) MultipartFile file) {

    System.out.println("잘호출되나?");

    System.out.println(weather); // "1", "2", "3", "4",  ""
    System.out.println(diary); // 여긴 changeName 이 null 인게 마즘
    System.out.println(file);

      String title = diary.getDyBoardTitle();
      String content = diary.getDyBoardContent();

      if(!file.getOriginalFilename().isEmpty() && !title.isEmpty() && !content.isEmpty()) {

        if (file.getSize() < 20000) {
          return "그림을 (더) 그려주세요";
      }

        String changeName = saveFile(file, session);
        diary.setOriginName(file.getOriginalFilename());
        diary.setChangeName("resources/fo/upfiles/" + changeName);
        System.out.println(diary.getChangeName()); // 잘찍힘

        int result = diaryService.insertDiary(diary);

        if(result > 0) {
            return "게시글 등록 완료";
        } else {
            return "게시글 등록 실패";
        }
    }

    // 필요한 데이터가 누락된 경우
    return "누락된 정보가 있습니다";
}

  private String saveFile(MultipartFile file, HttpSession session) {

      String originName = file.getOriginalFilename();
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

     System.out.println(file);

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

  @RequestMapping("diaryDetailView.bo")
  public ModelAndView selectDiary(ModelAndView mv,
                                                    int bno) {
          // System.out.println(bno);

          int result = diaryService.increaseCount(bno);

          if(result > 0) {

                Diary d = diaryService.selectDiary(bno);

                System.out.println(d);

                mv.addObject("d", d) .setViewName("fo/diary/diaryDetailView");

          } else {

            mv.addObject("errorMsg", "게시글 상세조회 실패") .setViewName("common/errorPage");
          }

          return mv;
  }

    @RequestMapping("dyDelete.bo")
    public String deleteDiary(int dyBoardNo,
                                         Model model,
                                         String filePath,
                                         HttpSession session) {

          // System.out.println(dyBoardNo);

       int result = diaryService.deleteDiary(dyBoardNo);

       if(result > 0) {

         if(!filePath.equals("")) {

               String realPath = session.getServletContext().getRealPath(filePath);
               new File(realPath).delete();
         }
           session.setAttribute("alertMsg", "게시글 삭제 성공");

           return "redirect:/diaryListView.bo";
       } else {

             model.addAttribute("errorMsg", "게시글 삭제 실패");

             return "common/errorPage";
       }

    }


}



