class SheetsColumn {
  static const String name = "Name";
  static const String id = "ID";
  static const String dept = "Department";

  static List<String> getColumns() => [name, id, dept];
}

//======================================
class User {
  final String name;
  final String? id;
  final String dept;

  //-------- Constructor------------
  const User({required this.name, required this.id, required this.dept});


  static User fromJson(Map<String, dynamic> json) => User(
      name: json[SheetsColumn.name],
      id: json[SheetsColumn.id],
      dept: json[SheetsColumn.dept]);

  Map<String, dynamic> toJson() => {
        SheetsColumn.name: name,
        SheetsColumn.id: id,
        SheetsColumn.dept: dept,
      };
}
