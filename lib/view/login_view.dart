import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_sample/res/components/round_button.dart';
import 'package:mvvm_sample/utils/routes/routes_name.dart';
import 'package:mvvm_sample/utils/utils.dart';
import 'package:mvvm_sample/view/home_screen.dart';
import 'package:mvvm_sample/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final heigth = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.email)),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: value,
                    decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                }),
            SizedBox(
              height: heigth * .085,
            ),
            RoundButton(
              title: 'Login',
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter email', context);
                }
                else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter email', context);
                }
                else if(_passwordController.text.length <6){
                  Utils.flushBarErrorMessage('Please enter 6 digit password', context);
                }
                else{
                  Map data={
                    'email': _emailController.toString(),
                    'password' : _passwordController.toString()
                  };
                  authViewModel.loginApi(data, context);
                  print('api hit');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
