import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/bloc/auth_bloc.dart';
import 'package:formvalidation/home_screen.dart';
import 'package:formvalidation/pallete.dart';
import 'package:formvalidation/widgets/gradian_button.dart';
import 'package:formvalidation/widgets/login_filed.dart';
import 'package:formvalidation/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(

        builder: (context, state) {
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: Pallete.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Pallete.backgroundColor,
              title: Text(
                "Login Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                Image.asset('assets/svg/signin_balls.png'),

                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                const SocialButton(
                  iconPath: 'assets/svg/g_logo.svg',
                  lable: "Continue with Google",
                  horizontalPadding: 60,
                ),
                const SizedBox(height: 20),
                const SocialButton(
                  iconPath: 'assets/svg/f_logo.svg',
                  lable: "Continue with Facebook",
                  horizontalPadding: 60,
                ),
                SizedBox(height: 30),
                LoginFiled(
                  hintText: "Email Address",
                  controller: EmailController,
                ),
                SizedBox(height: 10),
                LoginFiled(
                  hintText: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: 20),
                GradianButton(
                  onpressed: () {
                    context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        email: EmailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
