class Person {
  String name;
  int age;
  Person(this.name, this.age);

  // named constructor
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age as double,
    };
  }
}
