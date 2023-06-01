package com.earthball.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

public class ChangeFileName {

  public static String saveFile(MultipartFile upfile, HttpSession session) {

    // 파일명 수정 작업 후 서버에 업로드 시키기
    // => 파일명이 겹치지 않게끔

    // MyFileRenamePolicy 에서 지정했던 로직 그대로 재현
    // 예) "bono.jpg" => "20230511104425xxxxx.jpg"
    // 1. 원본파일명 뽑기
    String originName = upfile.getOriginalFilename(); // "bono.jpg"

    // 2. 현재 시간 형식을 문자열로 뽑아내기
    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

    // 3. 뒤에 붙을 5자리 랜덤값 뽑기
    int ranNum = (int)(Math.random() * 90000 + 10000);

    // 4. 원본파일명으로부터 확장자명 뽑기
    String ext = originName.substring(originName.lastIndexOf("."));

    // 5. 구한값들 합치기
    String changeName = currentTime + ranNum + ext;

    // 6. 업로드 하고자 하는 서버의 물리적인 경로 알아내기
    String savePath = session.getServletContext().getRealPath("/resources/upfiles/");

    // 7 . 경로와 수정파일명을 합체 후 파일을 업로드 해주기
    // MultipartFile 객체에서 제공하는 transferTo 메소드
    // [표현법]
    // upfile.transferTo(업로드하고자하는파일객체);
    try {
        File target = new File(savePath+changeName);
        upfile.transferTo(target);
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }


    return changeName;
  }

}
