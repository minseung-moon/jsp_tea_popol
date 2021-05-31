<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

    $(function(){

        $("#btn").click(function(){

            $.ajax({

                url: "id_check.jsp", 

                data:{userid:document.frm.userid.value},

                success: function(result) {

                    if(result==0)

                        document.getElementById("ck").innerText="사용불가능 아이디";

                    else

                        document.getElementById("ck").innerText="사용가능 아이디";

                }

            });

        });

    });

</script>

</head>

<body>

    <form name="frm" method="post" action="member_in_ok.jsp">

        아이디<input name="userid">

        <input type="button" id="btn" value="아이디 중복 체크">

        <span id="ck"></span>

        <p>

        비밀번호<input type="password" name="pwd"><p>

        이름<input name="name"><p>

        <input type="submit" value="회원가입">

    </form>

</body>

</html>

