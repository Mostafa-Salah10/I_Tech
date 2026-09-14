import 'package:flutter/material.dart';
import 'package:i_tech/models/onboarding_model.dart';
import 'package:i_tech/widgets/onboarding_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this._pageController});
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
    physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemCount: OnboardingModel.onboardingData.length,
      itemBuilder: (context, index) =>
          OnboardingPageViewItem(model: OnboardingModel.onboardingData[index]),
    );
  }
}
