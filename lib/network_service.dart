
import 'package:jsonplaceholder/model/Post.dart';
import 'package:http/http.dart' as http;
class NetworkService{
  Future<List<Post>> loadData() async{
    var response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return listFromJson(response.body);
  }
}