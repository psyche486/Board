<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<%	
	//boardList에서 전달 한 글 번호 
	String bbsNo = request.getParameter("bbsNo");
%>
</head>

<!-- 공통 JavaScript -->
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){		
	getBoardDetail();		
});

function getBoardDetail(){
	var bbsNo = $("#bbsNo").val();
	
	$.ajax({	
	    url		: "/board/getBoardDetail",
	    //data  : {key : value},
	    //data 	: $("#formDetailBoard").serialize(),
	    data  : {"bbsNo" : bbsNo},
        dataType: "JSON",
        type	: "GET",
        success : function(obj) {
        	getBoardDetailCallback(obj);				
        },	       
//        error 	: function(xhr, status, error) {
//        	alert("xhr:"+xhr+"\n"+"status:"+status+"\n"+"error:"+error);

//        }
        error:function(request,status,error){   
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
        }



        
        
     });
}

/** 게시판 - 상세 조회  콜백 함수 */
function getBoardDetailCallback(obj){
	var str = "";

	if(obj != null){								 
		var bbsNo =	obj.bbsNo;
		var bbsTitle 	= obj.bbsTitle;
		var bbsContent = obj.bbsContent; 
		var bbsWriter 	= obj.bbsWriter; 
		var bbsRegdt = obj.bbsRegdt;
		var bbsReadCount = obj.bbsReadCount; 

		str += "<tr>";
		str += "<th>글번호</th>";
		str += "<td>" + bbsNo + "</td>";
		str += "</tr>";	
		str += "<tr>";
		str += "<th>제목</th>";
		str += "<td><input type='text' id='bbsTitle' name='bbsTitle' value="+ bbsTitle + "></td>";
		str += "</tr>";
		str += "<tr>";
		str += "<th>내용</th>";
		//str += "<td><input type='text' id='bbsContent' name='bbsContent' value="+ bbsContent +"></td>";
		str += "<td><textarea cols='50' rows='10' id='bbsContent' name='bbsContent' placeholder='Input some text.'>"+ bbsContent +"</textarea></td>";
		str += "</tr>";				
		str += "<tr>";
		str += "<th>작성자</th>";
		str += "<td>" + bbsWriter + "</td>";
		str += "</tr>";	
		str += "<tr>";
		str += "<th>작성일</th>";
		str += "<td>" + bbsRegdt + "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<th>조회수</th>";
		str += "<td>" + bbsReadCount + "</td>";
		str += "</tr>";
				
	
	} else {	
		alert("No Data");
		return;
	}		
	
	$("#tbody").html(str);
}


/** 버튼 클릭시 분기 처리 수정/삭제 **/
function btnAction(mode){
	var theForm = document.formDetailBoard;
	
	if(mode == "update")
	{
		if(confirm("정말 수정 하시겠습니까??") == true){    //확인
			theForm.method = "post";
			theForm.target = "_self";
			theForm.action = "/board/update";
		 }else{   //취소
		     return false;
		}
	}
	else if(mode == "delete")
	{
		if(confirm("정말 삭제 하시겠습니까??") == true){    //확인
			theForm.method = "post";
			theForm.target = "_self";
			theForm.action = "/board/delete";
		 }else{   //취소
		     return false;
		}
	}
	theForm.submit();
}

/** 뒤로가기 버튼 **/
function goBack(){
	location.href ="/board/boardList";
}

</script>
<body>

  
<%
//
Map<String,Object> result = (Map<String,Object>)request.getAttribute("result");
%>
<h2>게시판 상세</h2>
<form name ="formDetailBoard" id="formDetailBoard">
<input type="hidden" id="bbsNo" name="bbsNo" value=<%=bbsNo%>> <!-- 게시글 번호 -->
	<table border="1" style="width:600px">
		<thead>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	
	<div>
		<button type="button" id="btnUpdate" name ="btnUpdate" onclick ="javascript:btnAction('update')">글수정(UPDATE)</button>
		<button type="button" id="btnDelete" name ="btnDelete" onclick ="javascript:btnAction('delete')">글삭제(DELETE)</button>
		<button type="button" id="btnBack" name ="btnBack" onclick="javascript:goBack()">뒤로가기</button>
	</div>
</form>
</body>
</html>