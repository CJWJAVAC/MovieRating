function CheckAddProduct() {

	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	
	// 상품아아디 체크
	if (!check(/^M[0-9]{4,11}$/, productId,
			"[영화 코드]\nM과 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 M으로 시작하세요"))
		return false;
	// 상품명 체크
	if (name.value.length <1 ) {
		alert("[영화명]\n영화 제목을 1글자 이상 작성해주세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[관객]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[관객]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	// 재고 수 체크
	

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}
