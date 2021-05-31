<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck()">
		제목 : <input type="text" name="title" /><br/>
		작성자 : <input type="text" name="writer" /><br/>
		날짜 : <input type="text" name="regdate" /><br/>
		게시글 : <textarea rows="10" cols="20" name="content"></textarea><br />
		<input type="submit" />
	</form>
	<script type="text/javascript">
		function formCheck(){
			let title = document.forms[0].title.value;
			let writer = document.forms[0].writer.value;
			let regdate = document.forms[0].regdate.value;
			let contnet = document.forms[0].contnet.value;
			
			if(title == null || title == "") {
				alert("제목을 입력하세요");
				document.forms[0].title.focus();
				return false;
			}
			if(writer == null || writer == "" || !writer.match(/^(\w+)@(\w+)[.](\w+)$/ig)) {
				alert("작성자를 입력하세요");
				document.forms[0].writer.focus();
				return false;
			}
			if(regdate == null || regdate == "" || !regdate.match(/^\d{6}$/)) {
				alert("날짜를 입력하세요");
				document.forms[0].regdate.focus();
				return false;
			}
			if(contnet == null || contnet == "") {
				alert("게시글을 입력하세요");
				document.forms[0].contnet.focus();
				return false;
			}
		}
	</script>
</body>
</html>