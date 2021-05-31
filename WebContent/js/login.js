(()=>{
	const toRegister = document.getElementById("toRegister");
    const toLogin = document.getElementById("toLogin");
    const loginForm = document.querySelector('.login');
    const registerForm = document.querySelector('.register');
    const userId = document.querySelector('#userId');
    const ck = document.getElementById("ck");
    const register = document.getElementById("register");
    const login = document.getElementById("login");
    
    // 회원가입으로 버튼 눌렀을 때
    toRegister.addEventListener('click',()=>{
    	loginForm.style.transform = "rotateY(180deg)";
    	registerForm.style.transform="rotateY(0deg)";
    	
    });
    // 로그인으로 버튼 눌렀을 때
    toLogin.addEventListener('click',()=>{
    	registerForm.style.transform="rotateY(180deg)";
    	loginForm.style.transform="rotateY(0deg)";
    });
    
    // 회원가입 중복 확인
    userId.addEventListener('change', ()=> {
    	const xml = new XMLHttpRequest(); // xml 객체 생성
    	const url = "idCheckProc.jsp?userId="+document.registerForm.userId.value; // form에 접근하여 값 갖고오기
    	xml.open("get", url); // 접근 방법
    	xml.send(); // 전달메소드
    	xml.onreadystatechange = function() {
    		if(xml.readyState == 4){ // readyState === 4 : 성공(전송완료)
    			if(xml.responseText == 0) { // 자바 코드를 제외한 모든 텍스트를 가져옴
    				ck.innerText="사용불가능아이디";
    				ck.classList.remove('success');
    				ck.classList.add('fail');
    			} else {
    				console.log(xml.responseText);
    				ck.innerText="사용가능아이디";
    				ck.classList.remove('fail');
    				ck.classList.add('success');
    			}
    		}
    	}
    });
    
    // 회원가입 유효성검사
    register.addEventListener('click', function(){
    	var check = false;
    	
    	const userId = document.getElementById("userId");
    	const userPw = document.getElementById("userPw");
    	const userName = document.getElementById("userName");
    	const userPhone2 = document.getElementById("userPhone2");
    	const userPhone3 = document.getElementById("userPhone3");
    	const userAddr = document.getElementById("userAddr");
    	const ck = document.getElementById("ck");
    	if(!userId.value.replace(/(\s*)/g, "") || !/^[a-zA-Z0-9]{5,10}$/.test(userId.value) || /(union|select|from|where)/i.test(userId.value) || ck.innerText == "사용불가능아이디"){
    		alert("아이디는 숫자와 영문자 조합으로 5~10자리를 사용해야 합니다(특정문자제외)");
    		userId.focus();
    	}else if(!userPw.value.replace(/(\s*)/g, "") || !/^[a-zA-Z0-9]{5,15}$/.test(userPw.value) || /(union|select|from|where)/i.test(userPw.value)){
    		alert("비밀번호는 숫자와 영문자 조합으로 5~15자리를 사용해야 합니다(특정문자제외)");
    		userPw.focus();
    	}else if(!userName.value.replace(/(\s*)/g, "")){
			alert("성함을 입력해주세요");
			userName.focus();
    	}else if(!userPhone2.value.replace(/(\s*)/g, "") || !/^[0-9]+$/.test(userPhone2.value)){
    		alert("중간번호에는 숫자만 입력해주세요");
    		userPhone2.focus();
    	}else if(!userPhone3.value.replace(/(\s*)/g, "") || !/^[0-9]+$/.test(userPhone3.value)){
    		alert("마지막번호에는 숫자만 입력해주세요");
    		userPhone3.focus();
    	}else if(!userAddr.value.trim() || !/^[가-힣0-9\s]+$/.test(userAddr.value)){
    		alert("주소를 입력해주세요(한글, 숫자, 공백)");
    		userAddr.focus();
    	}else {
    		check = true;
    	}
   
    	return check ? true : event.preventDefault();
    });
    
    // 로그인 유효성 검사
    login.addEventListener('click', function(){
    	var check = false;
    	const loginId = document.getElementById("loginId");
    	const loginPw = document.getElementById("loginPw");
    	
    	if(!loginId.value.replace(/(\s*)/g, "") || !/^[a-zA-Z0-9]{5,10}$/.test(loginId.value) || /(union|select|from|where)/i.test(loginId.value)){
    		alert("아이디는 숫자와 영문자 조합으로 5~10자리를 사용해야 합니다(특정문자제외)");
    		loginId.focus();
    	}else if(!loginPw.value.replace(/(\s*)/g, "") || !/^[a-zA-Z0-9]{5,15}$/.test(loginPw.value) || /(union|select|from|where)/i.test(loginPw.value)){
    		alert("비밀번호는 숫자와 영문자 조합으로 5~15자리를 사용해야 합니다(특정문자제외)");
    		loginPw.focus();
    	}else {
    		check = true;
    	}
    	
    	return check ? true : event.preventDefault();
    });
    // !/^[a-z0-9]{4,20}$/.test($("#userId").val())
//    if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){
//
//    	alert('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
//
//    	return false;
//
//    }
//    숫자만 가능 : [ 0 ~ 9 ] 주의 : 띄어쓰기 불가능
//    /^[0-9]+$/
//    한글만 가능 : [ 가나다라 ... ] 주의 : ㄱㄴㄷ... 형식으로는 입력 불가능 , 띄어쓰기 불가능
//    /^[가-힣]+$/
//    영문만 가능 :
//    	/^[a-zA-Z]+$/
//    /^[가-힣0-9\s]+$/ , 한글숫자공백    
})()