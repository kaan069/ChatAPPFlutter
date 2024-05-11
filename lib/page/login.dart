import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle_chat_app/page/register.dart';
import 'package:dev_muscle_chat_app/services/login.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:dev_muscle_chat_app/variables/login.dart';
import 'package:dev_muscle_chat_app/variables/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          const Spacer(),
          const Icon(
            Icons.fingerprint,
            size: 80,
            color: Colors
                .blue, // defaultColor değişkeni yoksa bunu kullanabilirsiniz.
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors
                        .blue, // cColor değişkeni yoksa bunu kullanabilirsiniz.
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.alternate_email,
                        color: Colors
                            .black, // textColor değişkeni yoksa bunu kullanabilirsiniz.
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: loginEmailController,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors
                        .blue, // cColor değişkeni yoksa bunu kullanabilirsiniz.
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.lock_outline,
                        color: Colors
                            .black, // textColor değişkeni yoksa bunu kullanabilirsiniz.
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: ValueListenableBuilder(
                        valueListenable: passwordVisibleIcon,
                        builder: (context, value, child) {
                          return TextField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                passwordVisibleIcon.value == Icons.visibility
                                    ? true
                                    : false,
                            controller: loginPasswordController,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                              hintText: "Şifre",
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          );
                        },
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      ValueListenableBuilder(
                        valueListenable: passwordVisibleIcon,
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              if (value == Icons.visibility) {
                                passwordVisibleIcon.value =
                                    Icons.visibility_off;
                              } else {
                                passwordVisibleIcon.value = Icons.visibility;
                              }
                            },
                            child: Icon(
                              value,
                              size: 20,
                              color: textColor.withOpacity(0.5),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await loginServices(context, loginEmailController.text,
                  loginPasswordController.text);
            },
            child: Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: cColor, // cColor değişkeni yoksa bunu kullanabilirsiniz.
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Giriş Yap",
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              CosmosNavigator.pushFromRightToLeft(context, const Register());
            },
            child: Text(
              "Hesabınız Yok Mu? Kayıt Olun!",
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
