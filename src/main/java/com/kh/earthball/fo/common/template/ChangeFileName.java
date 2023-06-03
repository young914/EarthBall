package com.kh.earthball.fo.common.template;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChangeFileName {

  public static String saveFile(MultipartFile upfile, HttpSession session) {
    String originName = upfile.getOriginalFilename();

    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

    int ranNum = (int) (Math.random() * 90000 + 10000);

    String ext = "";
    int dotIndex = originName.lastIndexOf(".");
    if (dotIndex >= 0) {
      ext = originName.substring(dotIndex);
    }

    String changeName = currentTime + ranNum + ext;

    String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");

    try {
      File target = new File(savePath + changeName);
      upfile.transferTo(target);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return changeName;
  }

}
