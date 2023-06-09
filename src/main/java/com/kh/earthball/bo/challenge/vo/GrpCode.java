package com.kh.earthball.bo.challenge.vo;

import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class GrpCode {

  private String grpCode;
  private String grpCodeName;
  private String status;

  // 카테고리 초이스 화면에서 뿌릴 용도
  private List<Code> codeList;

}
