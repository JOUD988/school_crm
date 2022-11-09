import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/consatans/fonts.dart';
import 'package:schoolcrm/view/screens/common/login/auth.dart';
import 'package:schoolcrm/view/screens/common/login/componants/call_school_botton.dart';
import 'package:schoolcrm/view/screens/driver/driver_map.dart';
import 'package:schoolcrm/view/screens/parent/home/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  void submit() {
    Provider.of<Auth>(context, listen: false).login(credentials: {
      'email': emailController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          primaryColor,
          secondaryColor,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: readexFont,
                    fontWeight: FontWeight.bold
                ),
              )),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  cursorColor: primaryColor,
                                  textAlign: TextAlign.right,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "الايميل",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child:  TextField(
                                  cursorColor: primaryColor,
                                  textAlign: TextAlign.right,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      hintText: "كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),

                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:primaryColor,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  submit();

                                  if(Provider.of<Auth>(context,listen: false).getRole(emailController.text) == "parent") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home()));
                                  }
                                  else if (Provider.of<Auth>(context,listen: false).getRole(emailController.text) == "driver") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DriverMap()
                                          ,),);
                                  }

                                  else{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home()));
                                  }

                                },
                                child: Text(
                                  "الدخول",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: readexFont),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),

                            callSchoolButton,

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
