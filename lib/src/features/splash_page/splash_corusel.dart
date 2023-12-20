import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/utils/context_utils.dart';
import '../auth/auth/auth_page.dart';
import '../main/doctors_profile/widgets/bottom_navigation_button.dart';

class SplashCorusel extends StatefulWidget {
  const SplashCorusel({super.key});

  @override
  State<SplashCorusel> createState() => _SplashCoruselState();
}

class _SplashCoruselState extends State<SplashCorusel> {
  final doctorImage = [
    AppImages.doctor1,
    AppImages.doctor2,
    AppImages.doctor3,
  ];

  final List<String> text = [
    "Thousands of doctor & experts to help your health!",
    "Health checks & consultations easily anywhere anytime",
    "Let's start living healthy and well with us right now!",
  ];

  int countIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: size.height * 0.2,
              left: size.width * 0.05,
              child: SizedBox(
                height: size.height * 0.9,
                width: size.width * 0.9,
                child: Image(
                  height: size.height / 2,
                  image: const AssetImage(
                    AppImages.bkgSplash,
                  ),
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: doctorImage.length,
              itemBuilder: (context, index, realIndex) {
                final imagePath = doctorImage[index];
                return Stack(
                  children: [
                    Positioned(
                      top: size.height * 0.07,
                      child: buildImages(context, imagePath, index),
                    ),
                    Positioned(
                      bottom: size.height * 0.07,
                      child: SizedBox(
                        width: size.width,
                        height: size.height * 0.29,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              topLeft: Radius.circular(60),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: buildText(
                              text[index],
                              index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                viewportFraction: 1,
                height: size.height,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 7),
                autoPlayCurve: Curves.fastOutSlowIn,
                initialPage: 0,
                pauseAutoPlayOnTouch: true,
                // Bu qatorni qo'shing
                onPageChanged: (index, reason) {
                  setState(() {
                    countIndex1 = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: size.height * 0.12,
              left: size.width * 0.4,
              child: buildIndicator(),
            ),
            Positioned(
              bottom: size.height * 0.01,
              child: BottomNavigationButton(
                text: "Next",
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImages(BuildContext context, String imagePath, int index) =>
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image(
          image: AssetImage(imagePath),
          height: MediaQuery.of(context).size.height * 0.72,
          fit: BoxFit.cover,
        ),
      );

  Widget buildText(String textPath, int index) => Column(
        children: [
          Text(
            textPath,
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
            ),
          ),
        ],
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: countIndex1,
        count: text.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 15,
          dotHeight: 10,
          expansionFactor: 3,
          radius: 100,
          spacing: 10,
          activeDotColor: Color(0xFF246BFD),
          dotColor: AppColors.sliderGrey,
        ),
      );
}
