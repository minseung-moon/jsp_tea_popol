(()=>{
	const submit = document.getElementById("submit");
	
	function checkUpload() {
		let check = false;
		const name = document.getElementById("name");
		const price = document.getElementById("price");
		const stock = document.getElementById("stock");
		const category = document.getElementById("category");
		const description = document.getElementById("description");
		
		if(!/^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅑ가-힣]{1,50}$/.test(name.value)) {
			alert("제품명을 입력해주세요!");
			name.focus();
		}else if(!/^[0-9]{1,}$/.test(price.value)){
			alert("제품 가격을 입력해주세요!");
			price.focus();
		}else if(category.selectedIndex < 1 || category.selectedIndex > 5 ) {
			alert("제품 카테고리를 선택해주세요!");
			category.focus();
		}else if(!/^[0-9]{1,}$/.test(stock.value)){
			alert("제품 재고수를 선택해주세요!");
			stock.focus();
		}else if(!/^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅑ가-힣\n\r\s]{1,}$/.test(description.value)){
			alert("제품 설명을 입력해주세요!");
			description.focus();
		}else {
			check = true;
		}
		return check?true:event.preventDefault();
	}
	
	submit.addEventListener('click', checkUpload);
})()