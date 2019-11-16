<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 페이지</title>

<!-- 공통 JavaScript -->
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
/** boardWrite 페이지 로딩  **/
$(document).ready(function(){
});

/** 회원 - 로그인 페이지 이동 */
function goLoginPage(){				
	location.href = "/board/login";
}

/** 회원 - 가입  */
function memberSave(){
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	var userNm = $("#userNm").val();
		
	if (userId == ""){			
		alert("ID를 입력해주세요.");
		$("#userId").focus();
		return;
	}
	
	if (userPw == ""){			
		alert("Password를 입력해주세요.");
		$("#userPw").focus();
		return;
	}

	if (userNm == ""){			
		alert("이름을 입력해주세요.");
		$("#userNm").focus();
		return;
	}
	
	var yn = confirm("회원정보를 등록하시겠습니까?");		
	if(yn){
			
		$.ajax({			
		    url		: "/board/memberJoin",
		    data    : $("#memberJoinForm").serialize(),
	        dataType: "JSON",
			type	: "POST",	
	        success : function(obj) {
	        	insertMemberCallback(obj);				
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

function insertMemberCallback(obj){
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
<h2>가입</h2>
<form name ="memberJoinForm" id="memberJoinForm">
	<table border="1"style="width:600px">
		<thead>
		</thead>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="userId" name="userId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="userPw" name="userPw"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="userNm" name="userNm"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="userAddress" name="userAddress"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="userEmail" name="userEmail"></td>
			</tr>									
		</tbody>
	</table>
</form>	
<div>
	<button type="button" id="btnGoLogin" name="btnGoLogin" onclick="javascript:goLoginPage()">뒤로</button>
	<button type="button" id="btnMemberSave" name="btnMemberSave" onclick="javascript:memberSave()">저장</button>
</div>
</body>
</html>