import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';
import 'package:projcet_cv/model/cv.dart';
import 'package:projcet_cv/views/CV%20Space/bloc/c_vv_bloc.dart';
import 'package:projcet_cv/widgets/custom_create_text.dart';

// ignore: must_be_immutable
class PersonalView2 extends StatelessWidget {
  PersonalView2({
    super.key,  this.cv,
  });
  final CV? cv;
  TextEditingController nameController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController institutionController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Platzi.mainColor,
      appBar: AppBar(
        title: const Text("CV Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: context.getWidth(context),
          height: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Title",
                    labelText: "Enter your title",
                    controller: titleController,
                  ),
                  size30,
                  Text("Name:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Name",
                    labelText: "Enter your name",
                    controller: nameController,
                  ),
                  size30,
                  Text("Summary:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Summary",
                    labelText: "Enter your Summary",
                    controller: summaryController,
                    maxLines: 10,
                    minLines: 10,
                  ),
                  size30,
                  Text("Address:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Address",
                    labelText: "Enter your Address",
                    controller: addressController,
                  ),
                  size30,
                  Text("Phone:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Phone",
                    labelText: "Enter your Phone",
                    controller: phoneController,
                  ),
                  size30,
                  Text("Email:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Email",
                    labelText: "Enter your Email",
                    controller: emailController,
                  ),
                  size30,
                  Text("Institution:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Institution",
                    labelText: "Enter your Institution",
                    controller: institutionController,
                  ),
                  size30,
                  Text("Degree:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Degree",
                    labelText: "Enter your Degree",
                    controller: degreeController,
                  ),
                  size30,
                  Text("Graduation Year:",
                      style: GoogleFonts.alata(
                        fontSize: 20,
                        color: Platzi.oceanColor,
                      )),
                  CVField(
                    hintText: "Graduation Year",
                    labelText: "Enter your graduation year",
                    controller: yearController,
                  ),
                  size30,
                  Text("Job Title:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Job Title",
                    labelText: "Enter your job title",
                    controller: jobController,
                  ),
                  size30,
                  Text("Company:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Company",
                    labelText: "Enter your company",
                    controller: companyController,
                  ),
                  size30,
                  Text("Period :",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Period ",
                    labelText: "Enter your period of experience",
                    controller: periodController,
                  ),
                  size30,
                  Text("Skill:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Skill",
                    labelText: "Enter your skills",
                    controller: skillController,
                  ),
                  size30,
                  Text("Language :",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(hintText: "Language", labelText: "Language"),
                  size30,
                  Text("Project Title:",
                      style: GoogleFonts.alata(
                          fontSize: 20, color: Platzi.oceanColor)),
                  CVField(
                    hintText: "Project Title",
                    labelText: "Enter your project title",
                    controller: projectController,
                  ),
                  size30,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CVvBloc>(context).add(UpdateCVEvent(
                                name: nameController.text,
                                summary: summaryController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                address: addressController.text,
                                institution: institutionController.text,
                                graduationYear: yearController.text,
                                jobTitle: jobController.text,
                                company: companyController.text,
                                period: periodController.text,
                                skill: skillController.text,
                                language: languageController.text,
                                project: projectController.text,
                                degree: degreeController.text,
                                title: titleController.text));
                            //context.push(context, CvVIEW());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Platzi.oceanColor,
                          ),
                          child: Text('Edit',
                              style: GoogleFonts.alata(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
