mixin class MessageValidation{
  String? messageValidate (String? value){
    if(value!.isEmpty){
      return "Mesaj içeriği giriniz";
    }
  }

  String? messageSubjectValidate (String? value){
    if(value!.isEmpty){
      return "Mesaj Konusu giriniz";
    }
  }

}