import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiRequest{
  static getRequest(String url)async{
    await Future.delayed(Duration(seconds: 1));
    var response= await http.get(Uri.parse(url)) ;
    if(response.statusCode==200)
    {
      var body=jsonDecode(response.body);
      return body ;
    }
    else
    {
      print("error ${response.statusCode}");
    }
  }

  static postRequest(String url,Map data)async{
    await Future.delayed(const Duration(milliseconds: 15));
    var response = await http.post(Uri.parse(url),body: data).timeout(
      const Duration(seconds: 1),
      onTimeout: (){
         http.Response t = http.Response('Error',408);
        return t;
      }
    );
    if(response.statusCode==200)
    {
      var body=jsonDecode(response.body);

      return body;
    }
    else
    {
      print("error in crud==========");
      print("error ${response.statusCode}");
    }
  }
}