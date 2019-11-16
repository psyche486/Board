<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Main</title>
<%
 	String sessionId = (String)session.getAttribute("userId");
	String sessionName = (String)session.getAttribute("userName");
%>
<!-- 공통 JavaScript -->
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	/** BoardList 페이지 로딩  **/
	$(document).ready(function(){
		getBoardList();			
		componentHide();	
	});

	/** 게시판 - 로드시 리스트 조회  **/
	function getBoardList(){
		var searchText = $("#searchText").val();
		$.ajax({			
		    url		:"/board/getBoardList",
		    data 	: $("#boardForm").serialize(),
		    dataType:"JSON",
			type	:"POST",
		    success : function(obj) {
				getBoardListCallback(obj);				
		    },	       
		    error : function(xhr, status, error) {}
		 });
	}
	
	/** 게시판 - 리스트 조회  콜백함수 **/
	function getBoardListCallback(obj){

		var list = obj.list;
		var listLen = list.length;
		//var listCount = obj.count;
		var str = "";

		if(listLen > 0){
			for(i = 0; i < listLen; i++){
				var bbsNo = list[i].bbsNo;
				var bbsTitle = list[i].bbsTitle;
				var bbsContent = list[i].bbsContent;
				var bbsWrite = list[i].bbsWriter;
				var bbsRegTime = list[i].bbsRegdt;
				var bbsCount = list[i].bbsReadCount;
			
				str += "<tr>";
				str += "<td>"+ bbsNo +"</td>";
				str += "<td><a onclick='javascript:goBoardDetail("+ bbsNo +");'>"+ bbsTitle +"</a></td>";
				//str += "<td><a href='/board/boardDetail?bbsNo='"+ bbsNo +">"+ bbsTitle +"</a></td>";
				str += "<td>"+ bbsWrite +"</td>";
				str += "<td>"+ bbsRegTime +"</td>"; 
				str += "<td>"+ bbsCount +"</td>";
				str += "</tr>";
			}
		}else{
			str += "<tr>"
			str += "<td colspan='6'>No Data</td>"
			str += "</tr>"		
		}
		
		$("#tbody").html(str);
	}

	/** 게시판 - 값 입력 후 조회 버튼 클릭 **/
	function goSearch(){
		var searchText = $("#searchText").val();
		getBoardList(searchText);
	}
	
	/** 게시판 - 상세 페이지 이동 **/
	function goBoardDetail(bbsNo){			
		location.href = "/board/boardDetail?bbsNo="+ bbsNo;
	}

	/** 게시판 - 작성 페이지 이동 **/
	function goBoardWrite(){		
		location.href = "/board/boardWrite";
	}
	
	/** 게시판 - 로그아웃 and 로그인 화면으로 이동 **/
	function gologout(){
		location.href="/board/logOut";
	}

	function componentHide(){
		var theForm = document.boardForm;
		if(theForm.searchOption.value=="regdate") {
			theForm.regdate.disabled=false;
			theForm.searchText.disabled=true;
			//theForm.searchText.hide();
			$("#regdate").show();
			$("#searchText").hide();
		}else{
			theForm.searchText.disabled=false;
			$("#regdate").hide();
			$("#searchText").show();
			//theForm.regdate.hide();
		}
	}

</script>
</head>
<body>
<div>
	<!-- 전체, 글번호, 등록일 추가 예정  -->
	<!-- 페이징 처리 예정  -->
	<%=sessionName%> 님이 접속 중입니다.
	<button type="button" onclick="javascript:gologout();">로그아웃</button>
</div>
<h2>게시글 목록</h2>
<form id="boardForm" name="boardForm">
	<!-- 전체, 글번호, 등록일 추가 예정-->
	<select id="searchOption" name="searchOption" onchange="javascript:componentHide()">
		<option value="title">제목</option>
		<option value="writer">이름</option>
		<option value="regdate">기간</option>
	</select>
	<input type="date" id="regdate" name="regdate">
	<input type="text" id="searchText" name="searchText">
	<button type="button" id="btnSearch" name="btnSearch" onclick="javascript:goSearch();">조회</button>
	<button type="button" id="btnWrite" onclick="javascript:goBoardWrite();">글쓰기</button>
	<table border="1" style="width:600px">
		<thead>
			<tr>
				<th>번호</th>	
				<th>제목</th>	
				<th>이름</th>	
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
</form>
</body>
</html>