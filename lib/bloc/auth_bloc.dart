import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit)async {
      emit(AuthLoading());
      try{
           final email=event.email;
    final password=event.password;
    
    if(password.length<6){
       return emit(AuthFailure("Password cannot be less 6 character"));
       

    }
    else if(!email.contains("@")){
    return  emit(AuthFailure("Invalid Email Address"));

      
    }else if(email.isEmpty){
      return emit(AuthFailure("Enter Email Please"));
    }
    await Future.delayed(
      
    const  Duration(seconds: 3),

    (){
      return emit(AuthSuccess(uid: "$email-$password"));
    }
    );
      }catch(e){
        emit(AuthFailure(e.toString()));
      }
 

    });
  }
}
