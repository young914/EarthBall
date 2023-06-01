package com.kh.earthball.bo.challenge.vo;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CategoryTemplate {

  private int categoryTemplateNo;
  private String inputType;
  private String status;
  private int sortNo;
  private String chSubTitle;
  private String grpCode;
  private int categoryNo;
  private List<Code> codeList;

}
