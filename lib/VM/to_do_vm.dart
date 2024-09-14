import 'package:api_app/models/to_do_model.dart';
import 'package:dio/dio.dart';

class ToDoVm {
  List<ToDoModel> toDos = [];
  List<ToDoModel> complateToDos = [];
  List<ToDoModel> notComplateToDo = [];

  getToDos() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get("https://dummyjson.com/todos");
      response.data['todos'].forEach((e) {
        toDos.add(ToDoModel.fromJson(e));
      });
      complateToDos = toDos.where((e) => e.completed!).toList();
      notComplateToDo = toDos.where((e) => !e.completed!).toList();
    } catch (e) {
      print(e);
    }
  }
}
