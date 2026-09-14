import 'package:flutter/material.dart';
import 'package:i_tech/models/onboarding_model.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -50,
          left: -70,
          child: Container(
            width: 400,
            height: 400,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 50),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 170,
                  backgroundImage: AssetImage(model.image),
                ),
              ),

              const SizedBox(height: 60),

              Text(
                model.title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                model.subTitle,

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
