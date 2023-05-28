package com.earthball.admin.categoryTemplate.vo;

import com.earthball.admin.code.vo.Code;
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
