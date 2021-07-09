import 'package:flutter/material.dart';
import 'package:udemy_mansur/shared/default_botten.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController= TextEditingController();
  var passWordController= TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswords = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   controller: emailController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Email Address',
                  //     border: OutlineInputBorder(),
                  //     prefixIcon: Icon(Icons.email),
                  //   ),
                  //   keyboardType: TextInputType.emailAddress,
                  //   onChanged: (value){
                  //     print(value);
                  //   },
                  //   validator: (value){
                  //     if(value!.isEmpty){
                  //       return ' address must not be empty';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  defaultTextFromField(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: ( String? value)
                    {
                      if(value!.isEmpty){
                        return ('Email must not be empty');
                      }
                      return null;
                    },
                    onChanged: (){
                      return print('rrrr');
                    },
                    onSubmit: (){
                      return print('');
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
              defaultTextFromField(
                  controller: passWordController,
                  label: 'password',
                  prefix: Icons.lock,
                  suffix: isPasswords ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPasswords,
                  suffixPressed: ()
                  {
                    setState(()
                    {
                       isPasswords = !isPasswords;
                    });
                  },
                  type: TextInputType.visiblePassword,
                  validate: ( String? value)
                  {
                    if(value!.isEmpty){
                      return ('password is too short');
                    }
                    return null;
                  },
              ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: (){
                      if(formKey.currentState!.validate()) {
                        print(emailController.text);
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: (){

                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account ?'
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                        'Register now'
                      ))
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
