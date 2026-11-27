import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Provider/Auth_Provider.dart';
import 'package:weatherapp/Provider/Password_Provider.dart';
import 'package:weatherapp/Views/SignUp_Screen.dart';
import 'package:weatherapp/Views/Weather_Screen.dart';
//suiiiiiiii
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final prpoviderobj = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 5),
              const Icon(Icons.person, size: 100),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hint: const Text("Email"),
                          fillColor: Colors.purple.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "The Email must not be null";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Consumer<PasswordProvider>(
                        builder: (context, value, child) {
                          return TextFormField(
                            controller: passwordcontroller,
                            obscureText: value.istrue,
                            decoration: InputDecoration(
                              hint: const Text("Password"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  value.passwordshow();
                                },
                                icon: value.istrue
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              fillColor: Colors.purple.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "The Password must not be null";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await prpoviderobj.getLoginProvider(
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                              );
                            }
                            if (prpoviderobj.LoginProviderObj!.status) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WeatherScreen(),
                                ),
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  prpoviderobj.LoginProviderObj!.message,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 15,
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("do not have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            child: const Text(
                            "SignUp",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}