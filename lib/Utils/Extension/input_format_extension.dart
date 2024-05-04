extension InputValidate on String {
  //이메일 포맷 검증
  String? isEmail() {
    final isEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
    if (!isEmail) return "올바른 형식의 이메일을 입력해 주세요.";
    return null;
  }

  //대쉬를 포함하는 010 휴대폰 번호 포맷 검증 (010-1234-5678)
  String? isPhone() {
    final isPhone = RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(this);
    if (!isPhone) return "올바른 형식의 휴대폰 번호를 입력해 주세요.";
    return null;
  }

  String? isPasswoard() {
    final isPwd =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$').hasMatch(this);
    if (!isPwd) return "영문·숫자·특수문자(!@#\$%^&*)를 포함하여 8자리 이상으로 구성해 주세요.";
    return null;
  }

  String? isPasswoardConfirm({required String compare}) {
    if (this != compare) return "비밀번호가 일치하지 않습니다.";
    return null;
  }
}
