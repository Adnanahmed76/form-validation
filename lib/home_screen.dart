import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/bloc/auth_bloc.dart';
import 'package:formvalidation/login_screen.dart';
import 'package:formvalidation/widgets/gradian_button.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Home",style: TextStyle(color: Colors.white),),),
        body: BlocConsumer<AuthBloc,AuthState>(
          builder: (context,state){
            if(state is AuthLoading){
              return Center(child: CircularProgressIndicator(),);
            }
if(state is AuthSuccess){
   return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("UID ${state.uid}"),
                GradianButton(onpressed: (){
                  context.read<AuthBloc>().add(AuthLogoutRequested());
        
                })
              ],
            ),
           );
}
else{
  return Text("Not Logged in Yet");
}
        }, listener: (context,state){
if(state is AuthInitial){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
}
        })

        );
  }
}