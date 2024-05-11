import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle_chat_app/page/login.dart';
import 'package:dev_muscle_chat_app/services/register.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:dev_muscle_chat_app/variables/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({Key? key});

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
                        Icons.person_2_outlined,
                        color: Colors
                            .black, // textColor değişkeni yoksa bunu kullanabilirsiniz.
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: registerNameController,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            hintText: "Kullanıcı Adı",
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
                          controller: registerEmailController,
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
                            controller: registerPasswordController,
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
              await registerServices(
                  context,
                  registerNameController.text,
                  registerEmailController.text,
                  registerPasswordController.text);
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
                  "Kayit Ol",
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              CosmosNavigator.pushFromLeftToRight(context, const Login());
            },
            child: Text(
              "Hesabınız mı var ? Giriş Yap!",
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
