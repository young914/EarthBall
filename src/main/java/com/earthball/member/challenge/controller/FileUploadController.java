package com.earthball.member.challenge.controller;

import com.earthball.member.challenge.dto.ChaFileDto;
import com.earthball.member.challenge.mapper.FileUpladMapper;
import com.earthball.member.challenge.service.FileUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@Controller
@RequiredArgsConstructor
public class FileUploadController {

  private final FileUploadService fileUploadService;
  private final FileUpladMapper fileUpladMapper;

  @ResponseBody
  @PostMapping("/challenge/file-upload")
  public ResponseEntity<ChaFileDto> setFileUpload(@RequestParam("file") MultipartFile file) {
    if (!file.isEmpty()) {
      return ResponseEntity.ok(fileUploadService.setFileUpload(file));
    } else {
      return ResponseEntity.badRequest().build();
    }
  }


  @ResponseBody
  @PostMapping("/select/fileNo")
  public int selectFileNo() {
    int fileNo = fileUpladMapper.getFileNo();
    return fileNo;
  }

}
