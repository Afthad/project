import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shein_app/constants/assets.dart';
import 'package:shein_app/constants/colors.dart';
import 'package:shein_app/routes.dart';
import 'package:shein_app/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                    child: Image.asset(
                      AppAssets.bg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    top: 80,
                    child: Image.asset(AppAssets.lg)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: .6,
                      offset: Offset(0, 1.4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.elliptical(100.0, -400.0))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text('Welcome!',
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700))),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Reprehenderit minim aliquip amet consectetur voluptate ullamco id. Aute exercitation ipsum enim voluptate ex cillum id consequat. ',
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGrey))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      width: 180,
                      text: 'Skip',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          LoginRoutes.signInView,
                        );
                      },
                      color: AppColors.primaryColor,
                      textColor: Colors.white),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Version 2.0.4',
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

