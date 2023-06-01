package com.earthball.board.model.vo;

import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Board {
  
  private int boardNo;
  private String boardTitle;
  private String boardWriter;
  private String boardContent;
  private String originName;
  private String changeName;
  private int count;
  private String createDate; // 날짜 타입을 문자열로 표기 가능, TO_CHAR 를 사용
  private String status;
  

}
