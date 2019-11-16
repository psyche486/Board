<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- 공통 JavaScript -->
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
/** BoardList 페이지 로딩  **/
$(document).ready(function(){
					
});

function goLogin(){
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
		
	if (userId == ""){			
		alert("ID를 입력해주세요.");
		$("#userId").focus();
		return;
	}
	
	if (userPw == ""){			
		alert("비밀번호를 입력해주세요.");
		$("#userPw").focus();
		return;
	}
	
	var theForm = document.logInForm;
	
	if(!userId == "" && !userPw == ""){
		theForm.method = "post";
		theForm.target = "_self";
		theForm.action = "/board/loginCheck";	
		theForm.submit();
	}else{   //취소
 		return false;
	}
}

function goJoin(){
	location.href="/board/goJoin";
}

function goWithdraw(){
	alert("구현중");
}

</script>
</head>
<body>
<h2>로그인 페이지</h2>
<form name ="logInForm" id="logInForm">
	<table border="1" style="width:400px">
		<tr>
			<td>아이디</td>
			<td><input type="text" id="userId" name="userId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="userPw" name="userPw"></td>
		</tr>
	</table>
</form>
<!-- 
	User Id:<br>
	<input type="text" id="userId" name="userId">
	<br>
	User password:<br>
	<input type="password" id="userPw" name="userPw">
 -->
<div>
	<button type="button" id="btnLogin" name="btnLogin" onclick="javascript:goLogin()">로그인</button>
	<button type="button" id="btnJoin" 	name="btnJoin" onclick="javascript:goJoin()">가입</button>
	<button type="button" id="btnWithdraw" 	name="btnWithdraw" onclick="javascript:goWithdraw()">탈퇴</button>
	<c:if test="${msg =='failure'}">
		<div>
			아이디 또는 비밀번호가 일치하지 않습니다.
		</div>
	</c:if>
	<c:if test="${msg =='logout'}">
		<div>
			로그아웃되었습니다.
		</div>
	</c:if>
</div>
</body>
</html>