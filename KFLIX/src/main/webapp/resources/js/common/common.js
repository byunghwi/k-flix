// 만 나이 계산
function calcAge(birth) {
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var day = date.getDate();
	if (month < 10)
		month = '0' + month;
	if (day < 10)
		day = '0' + day;
	var monthDay = month + day;
	birth = birth.replace("-", "").replace("-", "");
	var birthdayy = birth.substr(0, 4);
	var birthdaymd = birth.substr(4, 4);
	var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
	return age;
}

// 비밀번호 일치 확인
function checkSamePwd() {
	var password = document.getElementById("password").value;
	var passwordCheck = document.getElementById("password2").value;

	if (password == passwordCheck) {
		$("#password-check").text('비밀번호가 일치합니다.').css("color", "aqua").css("font-family", "Montserrat").css("font-size", "13px");
	} else {
		$("#password-check").text('비밀번호가 불일치합니다.').css('color', 'red').css("font-family", "Montserrat").css("font-size", "13px");;
	}
	
}

