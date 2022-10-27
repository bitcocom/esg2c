package kr.smhrd.entity;

import java.util.Date;

// 게시판(Object)->번호, 제목, 내용, 작성자, 작성일, 조회수,,,,,,,,,,
public class Board {
  private Long idx;
  private String title;
  private String content;
  private String writer;
  private Date indate;  //Data->String
  private Long count;
  
	public Long getIdx() {
		return idx;
	}
	public void setIdx(Long idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	// toString()
	@Override
	public String toString() {
		return "Board [idx=" + idx + ", title=" + title + ", content=" + content + ", writer=" + writer + ", indate="
				+ indate + ", count=" + count + "]";
	}
	
}
