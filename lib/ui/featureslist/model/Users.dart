class Users {
  int id ;
  String name;
  int year;
  double gpa;
  int term;
  String address;
  String birthday;
  String email;
  String gender;
  String phone;
  int section;
  


  Users(this.id,this.name,this.year,this.gpa,this.term,this.address,this.birthday,this.email,this.gender,this.phone,this.section);

  List<Users> usersList= List<Users> () ;

  List<Users> users = [
    Users(20000050, "bassant saaed", 4, 3.5, 1, "shobra", "22/6", "bassanth12@gmail.com", "female", "01140846001", 2)
    
  ];
}



