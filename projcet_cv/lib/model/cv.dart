class CV {
  String name;
  String summary;
  String phone;
  String email;
  String address;
  String institution;
  String graduationYear;
  String jobTitle;
  String company;
  String period;
  String language;
  String skill;
  String projectTitle;
  String degree;
  String title;

  CV({
    required this.name,
    required this.skill,
    required this.summary,
    required this.phone,
    required this.email,
    required this.address,
    required this.institution,
    required this.graduationYear,
    required this.jobTitle,
    required this.company,
    required this.period,
    required this.language,
    required this.projectTitle,
    required this.degree,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'summary': summary,
      'phone': phone,
      'email': email,
      'address': address,
      'institution': institution,
      'graduationYear': graduationYear,
      'jobTitle': jobTitle,
      'company': company,
      'period': period,
      'language': language,
      'project_title': projectTitle,
      'degree': degree,
      'skill': skill,
      'title': title,
    };
  }

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
        name: json['name'] ?? "",
        summary: json['summary']?? "",
        phone: json['phone']?? "",
        email: json['email']?? "",
        address: json['address']?? "",
        institution: json['institution']?? "",
        graduationYear: json['graduationYear']?? "",
        jobTitle: json['jobTitle']?? "",
        company: json['company']??"",
        period: json['period']??"",
        language: json['language']??"",
        projectTitle: json['project_title']??"",
        degree: json['degree']??"",
        skill: json['skill']??"",
        title: json['title']??"",
        );
  }
}
