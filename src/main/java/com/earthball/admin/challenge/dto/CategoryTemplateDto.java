package com.earthball.admin.challenge.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CategoryTemplateDto {

  private int categoryTemplateNo;
  private String inputType;
  private String status;
  private int sortNo;
  private String chSubTitle;
  private String grpCode;
  private int categoryNo;
  private List<CodeDto> codeDtoList;

}
