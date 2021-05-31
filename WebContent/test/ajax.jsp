<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script>

    // js를 이용한 ajax

    function check_id()    {    // 비동기방식으로 접근할 대상 정의

        var chk=new XMLHttpRequest();    // XML 객체 생성

        url="id_check.jsp?userid=" + document.frm.userid.value;    // 접근할 문서

        chk.open("get",url);    // "접근방식"

        chk.send();    // 전달 메소드

        chk.onreadystatechange=function() {

            if(chk.readyState==4)    // readyState == 4: 성공(전송완료)

                if(chk.responseText == 0) {    // 자바코드를 제외한 모든 텍스트를 가져옴

                    document.getElementById("ck").innerText="사용불가능아이디"

                }

                else {

                    document.getElementById("ck").innerText="사용가능아이디"

                }

        }

    }

</script>

</head>

<body>

    <form name="frm" method="post" action="member_in_ok.jsp">

        아이디<input name="userid">

        <input type="button" onclick="check_id()" value="아이디 중복 체크">

        <span id="ck"></span>

        <p>

        비밀번호<input type="password" name="pwd"><p>

        이름<input name="name"><p>

        <input type="submit" value="회원가입">

    </form>

</body>

</html>

