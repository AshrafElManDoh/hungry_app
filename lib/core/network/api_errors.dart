class ApiErrors {
  final String message ;
  final int? statuscode ;

  ApiErrors({required this.message, this.statuscode});

  @override
  String toString(){
    return "Error message : $message \nStatuscode : $statuscode";
  }
}