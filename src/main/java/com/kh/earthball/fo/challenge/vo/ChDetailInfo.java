package com.kh.earthball.fo.challenge.vo.;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChDetailInfo {

  private Integer chDetailInfoNo;
  private Integer chNo;
  private Integer categoryTemplateNo;
  private String chDetailInfoData;
  private String status;
  private String code;
  private String fileNo;

}