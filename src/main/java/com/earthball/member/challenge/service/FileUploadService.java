package com.earthball.member.challenge.service;

import com.earthball.member.challenge.dto.ChaFileDto;
import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

  ChaFileDto setFileUpload(MultipartFile multipartFile);

}
