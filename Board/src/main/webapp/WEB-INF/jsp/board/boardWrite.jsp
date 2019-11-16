<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 추가 테스트</title>

<!-- 공통 JavaScript -->
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
/** boardWrite 페이지 로딩  **/
$(document).ready(function(){
});

/** 게시판 - 목록 페이지 이동 */
function goBoardList(){				
	location.href = "/board/boardList";
}

/** 게시판 - 등록  */
function boardInsert(){

	var boardTitle = $("#bbsTitle").val();
	var boardContent = $("#bbsContent").val();
		
	if (boardTitle == ""){			
		alert("제목을 입력해주세요.");
		$("#bbsTitle").focus();
		return;
	}
	
	if (boardContent == ""){			
		alert("내용을 입력해주세요.");
		$("#bbsContent").focus();
		return;
	}
	
	var yn = confirm("게시글을 등록하시겠습니까?");		
	if(yn){
			
		$.ajax({			
		    url		: "/board/boardInsert",
		    data    : $("#WriterForm").serialize(),
	        dataType: "JSON",
			type	: "POST",	
	        success : function(obj) {
	        	insertBoardCallback(obj);				
	        },	       
//	        error 	: function(xhr, status, error) {
//	        	alert("Error");
//		    }
	        error:function(request,status,error){   
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	        }	        
	    });
	}
}

function insertBoardCallback(obj){
	if(obj != null){		
		var result = obj.result;
		
		if(result == "SUCCESS"){				
			alert("게시글 등록을 성공하였습니다.");				
			goBoardList();				 
		} else {				
			alert("게시글 등록을 실패하였습니다.");	
			return;
		}
	}
}
</script>

</head>
<body>
<h2>글쓰기</h2>
<form name ="WriterForm" id="WriterForm">
	<table border="1" style="width:600px">
		<thead>
		</thead>
		<tbody>
			<tr>
				<th>번호</th>
				<td><input type="text" id="bbsNo" name="bbsNo"></td>
			</tr>		
			<tr>
				<th>제목</th>
				<td><input type="text" id="bbsTitle" name="bbsTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols='50' rows='10' placeholder='Input some text.' id="bbsContent" name="bbsContent"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="bbsWriter" name="bbsWriter"></td>
			</tr>			
		</tbody>
	</table>
</form>	
<div>
	<button type="button" id="btnInsert" name="btnInsert" onclick="javascript:boardInsert()">SAVE</button>
	<button type="button" id="btnGoList" name="btnGoList" onclick="javascript:goBoardList()">Go List</button>
</div>
</body>
</html>