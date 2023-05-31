package com.earthball.member.challenge.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ChaFileDto {
  private Integer fileNo;
  private String fileName;
  private String filePath;
}
