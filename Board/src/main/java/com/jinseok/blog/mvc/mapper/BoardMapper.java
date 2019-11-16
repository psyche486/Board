package com.jinseok.blog.mvc.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.jinseok.blog.mvc.model.BoardVO;
import com.jinseok.blog.mvc.model.UserVO;

//Mapper interface 생성
@Mapper
public interface BoardMapper {
	
	// 사용자 로그인 확인
	public List<BoardVO> loginCheck(UserVO userVO);
	
	// 사용자 로그인 정보
	public UserVO loginMember(UserVO userVO);

	// 사용자 회원 가입
	public int memberJoin(UserVO userVO);

	// 게시판 리스트 조회 
	public List<BoardVO> getList(BoardVO boardVO);

	// 게시판 리스트 조회수 증가
	public void increaseCount(BoardVO boardVO);

	// 게시판 상세 
	public BoardVO getBoardDetail(BoardVO boardVO);
	
	// 게시판 등록
	public int boardInsert(BoardVO boardVO);

	// 게시판 삭제
	public void deleteBoard(BoardVO boardVO);

	// 게시판 수정
	public void updateBoard(BoardVO boardVO);

}
