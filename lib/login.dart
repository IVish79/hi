
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:register_app/sign.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x66fe987b),
                            Color(0x99fe987b),
                            Color(0xccfe987b),
                            Color(0xfffe987b),
                          ])),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Email(),
                        SizedBox(
                          height: 20,
                        ),
                        Password(),
                        SizedBox(
                          height: 8,
                        ),
                        Forgetpassbtn(),
                        SizedBox(
                          height: 8,
                        ),
                        Remembercheckbox(),
                        SizedBox(
                          height: 15,
                        ),
                        Loginbtn(),
                        SizedBox(
                          height: 15,
                        ),
                        Signupbtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget Email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Email',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Password',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Forgetpassbtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget Remembercheckbox() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.orange,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              )),
          Text(
            "Remember me",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget Loginbtn() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      height: 40,
      child: InkWell(
        onTap: () {},
        child: Center(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xfffe987b),
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Widget Signupbtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sign();
        },));
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'Don\'t have an Account? ',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 18)),
          TextSpan(text:  'Sign Up',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18))
        ],
        ),

      ),
    );
  }
}