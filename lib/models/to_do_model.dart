class ToDoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  ToDoModel({this.id, this.todo, this.completed, this.userId});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['completed'] = this.completed;
    data['userId'] = this.userId;
    return data;
  }
}
