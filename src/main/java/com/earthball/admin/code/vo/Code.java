package com.earthball.admin.code.vo;

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
public class Code {

	private String code;
	private String grpCode;
	private String codeName;
	private String status;
	private int sortNo;

}
