mixin class LoginValidation{
  String? EpostaTcValidate (String? value){
    if(value!.length == 0){
      return "E-Posta Adresi/T.C. Kimlik Numarası giriniz";
    }
  }

  String? PasswordValidate (String? value){
    if(value!.length == 0){
      return "Şifre giriniz.";
    }
  }
}