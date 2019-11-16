package com.jinseok.blog.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jinseok.blog.mvc.model.BoardVO;
import com.jinseok.blog.mvc.model.UserVO;
import com.jinseok.blog.mvc.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired BoardService boardService;
	
	/**
	 * 사용자 - 로그인 페이지 이동
	 * @param 
	 * @return String
	 */
	@RequestMapping("/login")
	public String login() throws Exception{
		
		return "board/logInPage"; 
	}
	
	/**
	 * 사용자 - 로그인 체크 후 분기
	 * @param 
	 * @return ModelAndView
	 */
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(UserVO userVO, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> list = boardService.loginCheck(userVO, session);
		
		Boolean result= false;
		
		if(list.size() > 0) {
			result = true;
		}
		
		//로그인 체크 후 분기 처리
		if(result == true) {
			mav.setViewName("board/boardList");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("board/logInPage");
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	
//	/**
//	 * 사용자 - 로그인 체크 후 분기
//	 * @param 
//	 * @return ModelAndView
//	 */
//	@RequestMapping("/loginCheck")
//	public ModelAndView loginCheck(UserVO userVO, HttpSession session) throws Exception{
//		
//		ModelAndView mav = new ModelAndView();
//		
//		List<BoardVO> list = boardService.loginCheck(userVO, session);
//		
//		Boolean result= false;
//		
//		if(list.size() > 0) {
//			result = true;
//		}
//		
//		//로그인 체크 후 분기 처리
//		if(result == true) {
//			mav.setViewName("board/boardList");
//			mav.addObject("msg", "success");
//		}else {
//			mav.setViewName("board/logInPage");
//			mav.addObject("msg", "failure");
//		}
//		
//		return mav;
//	}
	
	/**
	 * 회원 - 로그아웃 처리
	 * @param 
	 * @return ModelAndView
	 */
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		//세션 변수 개별 제거
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		//세션정보 초기화
		session.invalidate();
		
		mav.setViewName("board/logInPage");
		mav.addObject("msg", "logout");
		
		return mav;
	}
	
	/**
	 * 사용자 - 사용자 가입 페이지 이동
	 * @param 
	 * @return String
	 */
	@RequestMapping("/goJoin")
	public String goJoin() throws Exception{
		
		return "board/joinPage";
	}

	/**
	 * 사용자 - 사용자 회원 가입
	 * @param 
	 * @return String
	 */	
	@RequestMapping("/memberJoin")
	public ModelAndView memberJoin(UserVO userVO){

		boardService.memberJoin(userVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/logInPage");
		
		return mav;
	}
	
	/**
	 * 게시판 - 리스트 조회 이동
	 * @param 
	 * @return String
	 */
	@RequestMapping("/boardList")
	public String boardList() throws Exception{

		return "board/boardList"; 
	}
	
	/**
	 * 게시판 - 리스트 조회
	 * @param 
	 * @return List<Map<String,String>>
	 */
	@RequestMapping("/getBoardList")
	@ResponseBody
	public Map<String,Object> getList(BoardVO boardVO){
		
		Map<String,Object> map = new HashMap<>();				
		List<BoardVO> list = boardService.getList(boardVO);
		
		int count = list.size();
		
		//리스트를 맵에 저장
		map.put("list", list);
		map.put("count", count);

		return map; 
	}
	
	/**
	 * 게시판 - 리스트 상세 페이지 이동
	 * @param 
	 * @return String
	 */
	@RequestMapping("/boardDetail")
	public String detail(){
		
		return "board/boardDetail";
	}
	
	/**
	 * 게시판 - 게시판 상세 
	 * @param 
	 * @return BoardVO
	 */
	@RequestMapping("/getBoardDetail")
	@ResponseBody
	public BoardVO getBoardDetail(BoardVO boardVO){		
 
		BoardVO boardVo = boardService.getBoardDetail(boardVO);
		boardService.increaseCount(boardVO);
		
		return boardVo;
	}
	
	/**
	 * 게시판 - 작성 페이지 이동
	 * @param 
	 * @return String
	 */
	@RequestMapping("/boardWrite")
	public String addboard(){

		return "/board/boardWrite"; 
	}
	
	/**
	 * 게시판 - 게시판 등록
	 * @param 
	 * @return BoardVO, ModelAndView
	 */
	@RequestMapping(value="/boardInsert")
	@ResponseBody
	public BoardVO boardInsert(BoardVO boardVO){

		boardVO = boardService.boardInsert(boardVO);
		
		//확인
		ModelAndView mav = new ModelAndView("redirect:/board/boardList");
		
		return boardVO;
	}
	
	/**
	 * 게시판 - 게시판 삭제
	 * @param 
	 * @return ModelAndView
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");

		BoardVO boardVO = new BoardVO();
		boardVO.setBbsNo(Integer.parseInt(request.getParameter("bbsNo")));
 
		boardService.delete(boardVO);
		
		ModelAndView mav = new ModelAndView("redirect:/board/boardList");
		
		return mav;
	}
	
	/**
	 * 게시판 - 게시판 수정
	 * @param 
	 * @return ModelAndView
	 */
	@RequestMapping("/update")
	public ModelAndView update(BoardVO boardVO){
 
		boardService.update(boardVO);
		
		ModelAndView mav = new ModelAndView("redirect:/board/boardList");
		
		return mav;
	}
}
