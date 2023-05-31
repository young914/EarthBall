package com.earthball.member.challenge.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ChallengeDto {

  private Integer chNo;              // 챌린지일련번호
  private String chTitle;            // 챌린지명
  private String chStartDay;         // 챌린지시작일
  private String chEndDay;           // 챌린지종료일
  private String memberId;           // 회원아이디
  private Integer categoryNo;        // 카테고리일련번호
  private Integer fileNo;            // 파일일련번호
  private String code;               // 코드

  List<ChDetailInfoDto> list; //챌린저 상세 정보
}
