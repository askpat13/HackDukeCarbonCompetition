
Future<List> senddata() async {
  final response = await http.post("http://raushanjha.in/insertdata.php", body: {
    "name": user.text,
    "email": pass.text,
    "mobile":mobile.text,
  });

  var datauser = json.decode(response.body);