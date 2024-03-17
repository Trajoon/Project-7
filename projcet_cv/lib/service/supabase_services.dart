import 'package:projcet_cv/model/cv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  SupabaseClient supabase = Supabase.instance.client;

  Future signUp({required String email, required String password}) async {
    final response =
        await supabase.auth.signUp(email: email, password: password);

    return response.user!.id;
  }

  Future signIn({required String email, required String password}) async {
    final response = await supabase.auth
        .signInWithPassword(email: email, password: password);
    return response.user!.id;
  }

  Future<String> getUserByToken() async {
    final token = supabase.auth.currentSession?.accessToken;
    final userResponse = await supabase.auth.getUser(token);
    final user = userResponse.user!.id;
    return user;
  }

  Future logOut() async {
    await supabase.auth.signOut();
  }

  Future createData(
      String name,
      String summary,
      String phone,
      String email,
      String address,
      String institution,
      String graduationYear,
      String jobTitle,
      String company,
      String period,
      String skill,
      String language,
      String project,
      String degree,
      String title) async {
    await supabase.from('cv').insert([
      {
        'name': name,
        'summary': summary,
        'phone': phone,
        'email': email,
        'address': address,
        'institution': institution,
        'graduationYear': graduationYear,
        'skill': skill,
        'jobTitle': jobTitle,
        'company': company,
        'period': period,
        'language': language,
        'project_title': project,
        'degree': degree,
        'title': title,
      },
    ]).select();
  }

  Future FetchData() async {
    final userCV = await supabase
        .from('cv')
        .select('*')
        .match({'id': supabase.auth.currentSession!.user.id});
    print("Frtched data");
    List<CV> userInfo = [];

    for (var element in userCV) {
      userInfo.add(CV.fromJson(element));
    }
    print("$userCV");

    return userInfo;
  }

  Future FetchAllData() async {
    final userCV = await supabase
        .from('cv')
        .select('*');
    print("Frtched data");
    List<CV> userInfo = [];

    for (var element in userCV) {
      userInfo.add(CV.fromJson(element));
    }
    print("$userCV");

    return userInfo;
  }

  Future deleteData() async {
    await supabase
        .from('cv')
        .delete()
        .match({'id': supabase.auth.currentUser!.id});
  }

  Future updateData(
      String name,
      String summary,
      String phone,
      String email,
      String address,
      String institution,
      String graduationYear,
      String jobTitle,
      String company,
      String period,
      String skill,
      String language,
      String project,
      String degree,
      String title) async {
    await supabase.from('cv').update({
      'name': name,
      'summary': summary,
      'phone': phone,
      'email': email,
      'address': address,
      'institution': institution,
      'graduationYear': graduationYear,
      'jobTitle': jobTitle,
      'skill': skill,
      'company': company,
      'period': period,
      'language': language,
      'project_title': project,
      'degree': degree,
      'title': title,
    }).match({'id': supabase.auth.currentSession!.user.id});

    
  }

  Future addUser({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    await supabase.from('user').insert({
      'name': name,
      'email': email,
      'password': password,
    });
  }
}
