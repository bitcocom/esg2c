package kr.smhrd.repository;

import java.util.List;

import kr.smhrd.entity.Board;

// JDBC API(CRUD)->생산성이 떨어진다, 유지보수하기가 어렵다(Java+SQL) 
// MyBatis Framework : Java<--분리개발(mapping)--->SQL(xml)
// http://mybatis.org
public interface BoardMapper {
	// 전체리스트를 가져오는 메서드
	public List<Board> getList(); // select SQL~
	// 등록 메서드
	public void register(Board vo); // insert SQL~
	//상세보기(idx=3)
	public Board get(int idx); // select SQL~ 
	//삭제
	public void remove(int idx); // delete SQL~
	//수정
	public void update(Board vo);// update SQL~
	//조회수 누적
	public void countUpdate(int idx);// update SQL~
}
