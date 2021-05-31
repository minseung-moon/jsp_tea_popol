(()=>{
	const update = document.getElementById("update");
	
	update.addEventListener('click', function(){
    	let check = false;
    	
    	const userName = document.getElementById("userName");
    	const userPw = document.getElementById("userPw");
    	const userPhone = document.getElementById("userPhone");
    	const userAddr = document.getElementById("userAddr");
    	
    	if(!userName.value.replace(/(\s*)/g, "")){
    		alert("성함을 입력해주세요!");
    		userName.focus();
    	}else if(!userPw.value.replace(/(\s*)/g, "") || !/^[a-zA-Z0-9]{5,15}$/.test(userPw.value) || /(union|select|from|where)/i.test(userPw.value)){
    		alert("비밀번호는 숫자와 영문자 조합으로 5~15자리를 사용해야 합니다(특정문자제외)");
    		userPw.focus();
    	}else if(!userPhone.value.replace(/(\s*)/g, "") || !/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/.test(userPhone.value)){
    		alert("중간번호에는 숫자만 입력해주세요");
    		userPhone.focus();
    	}else if(!userAddr.value.trim() || !/^[가-힣0-9\s]+$/.test(userAddr.value)){
    		alert("주소를 입력해주세요(한글, 숫자, 공백)");
    		userAddr.focus();
    	}else {
    		check = true;
    	}
   
    	return check ? true : event.preventDefault();
    });
})()