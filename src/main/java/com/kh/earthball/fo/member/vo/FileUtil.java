package com.kh.earthball.fo.member.vo;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

    public class FileUtil {
      
      private static final String filePath = ""; // 파일저장 위치
      
      public String updateImg(MultipartHttpServletRequest mpRequest) throws Exception {
        
        Iterator<String> iterator = mpRequest.getFileNames();
        
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        
        String memberImg = "";
        
        File file = new File(filePath);
        if(file.exists() == false) {
            file.mkdirs();
        }
        
        while(iterator.hasNext()) {
            multipartFile = mpRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false ) {
                originalFileName = multipartFile.getOriginalFileName();
            }
        }
        
      }
      
  
}
