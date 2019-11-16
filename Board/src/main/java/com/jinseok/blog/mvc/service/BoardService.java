package com.jinseok.blog.mvc.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jinseok.blog.mvc.mapper.BoardMapper;
import com.jinseok.blog.mvc.model.BoardVO;
import com.jinseok.blog.mvc.model.UserVO;

@Service
public class BoardService {                  
                                                                  
	@Autowired BoardMapper boardMapper; 
	
	// 사용자 로그인 확인
	public List<BoardVO> loginCheck(UserVO userVO, HttpSession session) {

		List<BoardVO> list = boardMapper.loginCheck(userVO);	
		UserVO userVO2 = boardMapper.loginMember(userVO);

		if(list.size() > 0) {		
			session.setAttribute("userId",userVO2.getUserId());
			session.setAttribute("userName", userVO2.getUserNm());
		}
		
		return list;
	}
	
	// 사용자 회원 가입
	public int memberJoin(UserVO userVO) {
		
		return boardMapper.memberJoin(userVO);
	}
	
	// 게시판 리스트 조회 
	public List<BoardVO> getList(BoardVO boardVO) {
		
		List<BoardVO> list = boardMapper.getList(boardVO);		
		
		return list;
	}
	
	// 게시판 리스트 조회수 증가
	public void increaseCount(BoardVO boardVO) {
		
		boardMapper.increaseCount(boardVO);
	}
	
	// 게시판 상세 
	public BoardVO getBoardDetail(BoardVO boardVO) {
		
		BoardVO boardVo = boardMapper.getBoardDetail(boardVO);
		
		return boardVo;	
	}

	// 게시판 등록
	public BoardVO boardInsert(BoardVO boardVO) {

		int insertCnt = boardMapper.boardInsert(boardVO);

		if (insertCnt > 0) {
			boardVO.setResult("SUCCESS");
		} else {
			boardVO.setResult("FAIL");
		}
		
		return boardVO;
	}
	
	// 게시판 삭제
	public void delete(BoardVO boardVO) {
		
		boardMapper.deleteBoard(boardVO);
	}

	// 게시판 수정
	public void update(BoardVO boardVO) {
		
		boardMapper.updateBoard(boardVO);
	}
}
