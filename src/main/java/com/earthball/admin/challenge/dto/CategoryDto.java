package com.earthball.admin.challenge.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CategoryDto {

  private int categoryNo;
  private String categoryName;
  private String status;
}
