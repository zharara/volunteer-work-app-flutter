
String? fieldRequiredValidator(String? input){
  if(input?.isEmpty ?? true){
    return 'هذا الحقل مطلوب';
  }
  return null;
}