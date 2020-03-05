class Course {
  final String id;
  final String name;
  final int  hours;

  Course(this.id, this.name, this.hours);
  List<Course> coursesList= List<Course> () ;



}


List<Course> courses = [ Course("cs1", "formal", 12),
  Course("cs2", "database", 12),
  Course("cs3", "image", 12),
  Course("cs4", "network", 12),
  Course("cs5", "oop", 12),
  Course("cs6", "is", 12),];