import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './widgets/loginform.dart';
import './widgets/socialicons.dart';
import './customicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './register_page.dart';

// void main() => runApp(MaterialApp(
//   home: MyApp(),
//   debugShowCheckedModeBanner: false,
// ));



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isSelected = false;

  void _radio(){
    setState(() {
     _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected)=>Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width:  2.0, color: Colors.grey[500]),
    ),
    child: isSelected ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[700],

      ),
    )
    :Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );


  

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 770, height: 1334, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image(image: AssetImage('images/subicjobs-login-header.jpg'),),
              )
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 30.0, top: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(image: AssetImage(
                        'images/subicjobs-login-logo.jpg'),
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                        ),
                      Text("SubicJobs",
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          fontSize:  ScreenUtil.getInstance().setSp(46),
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                        height: ScreenUtil.getInstance().setHeight(300),
                  ),
                  LoginForm(),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 12,),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(width: 8.0,),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontFamily: "Poppines-Medium", fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330.0),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea),
                              ]
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [BoxShadow(
                              color:(Color(0xFF6078ea).withOpacity(.3)),
                              offset: Offset(0.0, 8.0),
                              blurRadius: 8.0,
                              )
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){},
                              child: Center(
                                child: Text(
                                  "Signin",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // horizontal
                      horizontalLine(),
                      Text("Social Login",
                        style:TextStyle(
                          fontFamily: "Poppins-medium",
                          fontSize: 16.0
                        ),
                      ),
                       horizontalLine(),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        [ Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),],
                        CustomIcons.facebook,
                        (){},
                      ),
                      SocialIcon(
                        [ Color(0xFFff4f38),
                          Color(0xFFff355d),],
                        CustomIcons.google,
                        (){},
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("New User?",
                      style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){ return Register();})),
                        child: Text("Signup",
                        style: TextStyle(
                          color: Color(0xFF5d74e3),
                          fontFamily: "Poppins-Bold"
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      
    );
  }
}