package kr.smhrd.entity;

import java.util.Date;

import lombok.Data;

// 게시판(Object)->번호, 제목, 내용, 작성자, 작성일, 조회수,,,,,,,,,,
@Data
public class Board {
  private Long idx;
  // 회원ID
  private String memId;
  private String title;
  private String content;
  private String writer;
  private Date indate;  //Data->String
  private Long count;
  
}
