package com.kh.earthball.fo.diary.controller;

import java.io.IOException;
import java.io.InputStream;
import org.apache.taglibs.standard.extra.spath.Path;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage) {

    // System.out.println("cPage : " + currentPage);

    // 페이징 처리를 위한 PageInfo 객체 얻어내기
     int listCount = diaryService.selectListCount();

      int pageLimit = 5;
      int dyBoardLimit = 6;

      // Pagination 에 작성한 getPageInfo 메소드 호출
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, dyBoardLimit);

      System.out.println(pi);

      // 포워딩 테스트
      return "fo/diary/diaryListView";
  }

  @RequestMapping("diaryEnrollForm.bo")
  public String diaryEnrollForm() {
    return "fo/diary/diaryEnrollForm";
  }

  // @PostMapping("/upload")
  // public String upload(@RequestParam("file") MultipartFile file) {

      // System.out.println("파일 이름 : " + file.getOriginalFilename());
      // System.out.println("파일 크기 : " + file.getSize());

   //  try (
      //FileOutputStream fos = new FileOutputStream("/resources/fo/diaryUploadFiles" + file.getOriginalFilename());
        // 파일 저장할 경로 + 파일명을 파라미터로 넣고 fileOutputStream 객체 생성하고
       // InputStream is = file.getInputStream();) {
       // file로 부터 inputStream을 가져온다.

    //int readCount = 0;
   // byte[] buffer = new byte[1024];
    // 파일을 읽을 크기 만큼의 buffer를 생성하고
    // ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)

    //while ((readCount = is.read(buffer)) != -1) {
        //  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고

        // fos.write(buffer, 0, readCount);
        // 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
    //}
// } catch (Exception ex) {
   // throw new RuntimeException("file Save Error");
//}

//return "uploadok";
//};

















  @RequestMapping("diaryInsert.bo")
  public void dyInsertBoard(Diary d,
                                        MultipartFile upfile) {

        System.out.println(d);
        System.out.println(upfile);
  }


}
