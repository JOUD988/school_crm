class Course {

  String name;
  int mark;
  String category;
  Course({this.name,this.mark,this.category});



  Future<List<Course>> getMarks() async
  {
    List<Course> marks  = [];

    marks.add(Course(name: "physics",mark: 20,category: "nazary"));
    marks.add(Course(name: "math",mark: 20,category: "ddw"));
    return marks;
  }




}