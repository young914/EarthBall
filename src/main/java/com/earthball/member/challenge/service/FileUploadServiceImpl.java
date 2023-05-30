package com.earthball.member.challenge.service;

import com.earthball.member.challenge.dto.ChaFileDto;
import com.earthball.member.challenge.mapper.FileUpladMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Slf4j
@Service
public class FileUploadServiceImpl implements FileUploadService {

  private final ServletContext servletContext;
  private final ResourceLoader resourceLoader;
  private final String DEFAULT_FILE_PATH = "/resources/upload";
  private final FileUpladMapper fileUpladMapper;

  public FileUploadServiceImpl(
      ServletContext servletContext
      , FileUpladMapper fileUpladMapper
      , ResourceLoader resourceLoader) {
    this.servletContext = servletContext;
    this.fileUpladMapper = fileUpladMapper;
    this.resourceLoader = resourceLoader;
  }

  @Override
  public ChaFileDto setFileUpload(MultipartFile multipartFile) {
    Integer fileNo = fileUpladMapper.getFileNo();
    String fileExtension = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
    String filePath = DEFAULT_FILE_PATH + "/" + fileNo + "."
        + fileExtension;

    try {
      File file = new File(
          servletContext.getRealPath("/") + filePath);

      Files.createDirectories(Paths.get(file.getParent()));
      multipartFile.transferTo(file);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }

    ChaFileDto chaFileDto = ChaFileDto.builder()
        .fileNo(fileNo)
        .fileName(multipartFile.getOriginalFilename())
        .filePath(filePath)
        .build();
    int reulst = fileUpladMapper.insertChaFile(chaFileDto);

    if (reulst == 0) {
      throw new RuntimeException();
    }
    return chaFileDto;
  }
}
