import 'package:flutter/material.dart';
import 'package:login/pages/login_and_SignUp_pages/dialogForgotPassword.dart';

class ManagerLoginPage extends StatefulWidget {
  @override
  _ManagerLoginPageState createState() => _ManagerLoginPageState();
}

class _ManagerLoginPageState extends State<ManagerLoginPage> {
  // _LoginPageState({ String email,String password});
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isChecked = false;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Center(
              child: Text(
          'Manager Login',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(top: 4.0, left: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: double.infinity,
          height: 1.5,
          color: Colors.black,
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (emailInput) => _email = emailInput,
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Invalid Email';
        }
      },
      decoration: InputDecoration(
          labelText: 'Email / MID',
          hintText: 'xyz@mail.com / M14',
          icon: Icon(Icons.alternate_email)),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'Password Invalid';
        }
      },
      decoration: InputDecoration(
        icon: Icon(Icons.lock_open),
        labelText: 'Password',
        hintText: '********',
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye, color: _eyeButtonColor),
            onPressed: () {
              if (_isObscured) {
                setState(() {
                  _isObscured = false;
                  _eyeButtonColor = Theme.of(context).primaryColor;
                });
              } else {
                setState(() {
                  _isObscured = true;
                  _eyeButtonColor = Colors.grey;
                });
              }
            }),
      ),
      obscureText: _isObscured,
    );
  }

  Padding buildForgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.black, fontSize: 12.0),
          ),
          // onPressed: _showModalSheet,
          onPressed: () async {
            final action = await Dialogs.yesSubmitDialog(
                context, 'Forgot Password?', 'Email/Phone');
            if (action == ForgotPasswordDialogAction.submit) {
              Navigator.of(context).canPop();
            } else {
              Navigator.of(context).canPop();
            }
          },
        ),
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              //TODO: Check Values and navigate to new Page
              Navigator.of(context).pushNamed('/managerHomePage');
            }
          },
          splashColor: Colors.grey[900],
          color: Colors.deepPurple,
          child:
              Text('LOGIN', style: Theme.of(context).primaryTextTheme.button),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }

  Align buildOrText() {
    return Align(
      alignment: Alignment.center,
      child: Text('Or Login with',
          style: TextStyle(
              fontSize: 12.0, color: Colors.grey, letterSpacing: 4.0)),
    );
  }

  Container buildSocialMediaButtons(IconData icon, Color iconColor) {
    return Container(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30.0),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      height: 46.0,
      width: 46.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 0.5)),
    );
  }

  // Align buildNoAcSignUp() {
  //   return Align(
  //     child: RichText(
  //         text: TextSpan(
  //             text: 'You Don\'t have an account?',
  //             style: TextStyle(color: Colors.grey,fontSize: 12.0,),
  //             children: <TextSpan>[
  //               TextSpan(
  //                 text: 'SIGN UP',
  //                 style: TextStyle(color: Colors.black,fontSize: 12.0,fontWeight: FontWeight.bold,letterSpacing: 10.0),
  //               )
  //             ]
  //         )
  //     ),
  //   );
  // }
  Padding buildDontHaveAnAccount() {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Don\'t Have an account?',
          style:
              TextStyle(color: Colors.grey, letterSpacing: 4.0, fontSize: 12.0),
        ),
      ),
    );
  }

  Padding buildSignUpFlatButton() {
    return Padding(
        padding: EdgeInsets.all(1.0),
        child: Container(
          alignment: Alignment.center,
          child: FlatButton(
            child: Text(
              'SIGNUP A COMPANY',
              style: TextStyle(
                  color: Colors.black87, letterSpacing: 1.0, fontSize: 12.0),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/registerCompany');
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterACompany(),fullscreenDialog: true));
            },
          ),
        ));
  }

  Container buildCheckboxKeepMeLoggedIn() {
    return Container(
      margin: EdgeInsets.only(left: 25.0, right: 90.0),
      child: CheckboxListTile(
        activeColor: Colors.blue,
        value: _isChecked,
        onChanged: (v) {
          setState(() {
            _isChecked = !_isChecked;
          });
        },
        title: Text('Keep me logged In'),
        subtitle: Text('As Manager'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(),
      child: Form(
        key: _formKey,
        child: ListView(
          // padding: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            
            SizedBox(height: kToolbarHeight),
          
            FlatButton.icon(
              color: Colors.deepPurple,
              splashColor: Colors.grey[900],
              icon: Icon(Icons.arrow_back,size: 30.0,color: Colors.white,),
              label: Text('Tap to select profile',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 15.0,),
            buildTitle(),
            buildTitleLine(),
            SizedBox(
              height: 20.0,
            ),
            buildEmailTextField(),
            SizedBox(
              height: 10.0,
            ),
            buildPasswordTextField(),

            // buildCheckboxKeepMeLoggedIn(),
            SizedBox(
              height: 10.0,
            ),
            buildLoginButton(context),
            buildForgotPasswordText(),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Container(
                    height: 1.5, width: 700.0, color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            buildOrText(),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildSocialMediaButtons(Icons.email, Colors.red),
                SizedBox(width: 16.0),
                buildSocialMediaButtons(Icons.phone, Colors.green),
                SizedBox(width: 16.0),
                buildSocialMediaButtons(Icons.person, Colors.yellow),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                    height: 1.5, width: 700.0, color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            buildDontHaveAnAccount(),
            buildSignUpFlatButton(),

            // buildForgotPasswordDialog()
          ],
        ),
      ),
    ));
  }
}
