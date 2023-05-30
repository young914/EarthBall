package com.earthball.admin.challenge.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CodeDto {

  private String code;
  private String grpCode;
  private String codeName;
  private String status;
  private int sortNo;

}
