package com.earthball.member.challenge.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChDetailInfoDto {

    private Integer chDetailInfoNo;
    private Integer chNo;
    private Integer categoryTemplateNo;
    private String chDetailInfoData;
    private String status;
    private String code;
    private String fileNo;

}
