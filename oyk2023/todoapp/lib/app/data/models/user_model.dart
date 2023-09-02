class User {
  int? id;
  String? email;
  String? hashedPassword;
  bool? isActive;
  String? creationDate;
  List<Tasks>? tasks;

  User(
      {this.id,
      this.email,
      this.hashedPassword,
      this.isActive,
      this.creationDate,
      this.tasks});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    hashedPassword = json['hashed_password'];
    isActive = json['is_active'];
    creationDate = json['creation_date'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks?.add(Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['hashed_password'] = hashedPassword;
    data['is_active'] = isActive;
    data['creation_date'] = creationDate;
    if (tasks != null) {
      data['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? id;
  String? title;
  String? description;
  int? ownerId;
  String? creationDate;

  Tasks(
      {this.id, this.title, this.description, this.ownerId, this.creationDate});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    ownerId = json['owner_id'];
    creationDate = json['creation_date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['owner_id'] = ownerId;
    data['creation_date'] = creationDate;
    return data;
  }
}
