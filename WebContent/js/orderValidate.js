(()=>{
	
	const submit = document.getElementById("submit");
	
	submit.addEventListener('click', function () {
		let check = false;
		const amount = document.getElementById("amount");
		const stock = document.getElementById("stock");
		const userId = document.getElementById("userId");
		
		if(userId.value === "") {
			location.href ="login.jsp";
			
		}else if(isNaN(amount.value) || amount.value > stock.textContent*1 || amount.value < 1) {
			alert('주문 수량을 입력해주세요.');
			order.focus();
		}else check = true;

		return check ? true : event.preventDefault();
	});
})()