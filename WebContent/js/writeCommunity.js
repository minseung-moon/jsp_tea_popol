(()=>{
	const submit = document.getElementById("submit");
	
	function checkUpload() {
		let check = false;
		const title = document.getElementById("title");
		const content = document.getElementById("content");
		
		if(!/^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅑ가-힣]{1,50}$/.test(title.value)) {
			alert("제목을 입력해주세요!");
			title.focus();
		}else if(!/^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅑ가-힣\n\r\s]{1,}$/.test(content.value)){
			alert("내용을 입력해주세요!");
			content.focus();
		}else {
			check = true;
		}
		return check?true:event.preventDefault();
	}
	
	submit.addEventListener("click", checkUpload);
})()