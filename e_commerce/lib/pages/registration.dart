import 'package:e_commerce/utils/all_routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  //button action
  moveTOHome(BuildContext context) async {
    //we are using set state because of making chage button true

//form key always have widget id(like findviewbyid in android). so, if we need to use this Textfield then we could get id through this _fromKey
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, AllRoutes.homeRoutes);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              Text(
                "Welocme $name",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "User Name", labelText: "User Name"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User Name can not be empty.";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password", labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Password can not be empty.";
                        else if (value.length < 6)
                          return "Password have to be six digits";
                        else
                          return null;
                      },
                    )
                  ],
                ),
              ),

              const SizedBox(height: 40.0),
              // Container(

              //insteated container use inkwell/ gesturedetector because Container does not have on clik
              //   height: 50,
              //   width: 150,
              //   child: Text("Login",
              //   style: TextStyle(color: Colors.white,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 20
              //   ),
              //   ),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: Colors.deepPurple,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),

              InkWell(
                onTap: () {
                  moveTOHome(context);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 60,
                  width: changeButton ? 60 : 150, //ternary operator use
                  child: changeButton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(changeButton ? 60 : 8),
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () => {
              //     //this is one way
              //     // Navigator.push(context, MaterialPageRoute(builder: ((context) {
              //     //   return HomePage();
              //     // }))),

              //     //this is smart way if have multiple pages
              //     Navigator.pushNamed(context, AllRoutes.homeRoutes),
              //     //Navigator.pop(context),
              //   },
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(
              //     minimumSize: Size(120.0, 40.0),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
