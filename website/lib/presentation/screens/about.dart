import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/session_manager.dart';
import 'package:website/utils/texttheme_manager.dart';
import 'package:website/utils/toast.dart';

import '../../utils/responsive_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBackground(
        page: Padding(
      padding: EdgeInsets.all(ScreenSize.isWebMobile
          ? Constants.smallPaddingMobile
          : Constants.smallPadding),
      child: ScreenSize.isWebMobile ? const MobileBody() : const WebBody(),
    ));
  }
}

class WebBody extends StatelessWidget {
  const WebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TTheme.displayText,
          ),
          const SizedBox(height: Constants.largePadding),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth:
                      ScreenSize.width != null ? ScreenSize.width! * 0.5 : 500,
                  maxHeight: ScreenSize.height != null
                      ? ScreenSize.height! * 0.5
                      : 500),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/png/yearbook.jpg",
                      width: ScreenSize.width != null
                          ? ScreenSize.width! * 0.2
                          : 250,
                    ),
                    const SizedBox(height: Constants.padding),
                    Text(
                      "Welcome! I am Tommaso Zanatta, as you could have already guessed by now. \n\nI should start from the beginning. I have always been a curious person, always asking questions and with lots of interests. I graduated from the I.T.I.S. Einaudi-Scarpa in Montebelluna, where my coursework was focused on International Relations and Marketing. I then moved to the amazing Ca'Tron, where I enrolled in the Digital Management Bachelor's of Science at H-FARM College. I had the opportunity to study in a multicultural and diverse environment, parallel to the continuously evolving and technologically advanced campus. \nMy dissertation was about the impact of AI-powered Chatbots (focused on Generative Pre-Trained transformers) on the supply chain management, more specifically on how they can streamline processes.\nDuring my time at H-FARM College, I was also continuously developing my programming knowledge, being passionate about Python from the early years of High School, I then moved on to Dart, because I was fascinated about the process of actually creating something tangible, like a mobile app.\nI had, almost by chance, the opportunity to start working as a Flutter Developer during summer, where I started the process of improvement that led me to the current state of my knowledge in this domain. During the third year of my Bachelor's, I continued working at the same company, getting to know better the colleagues who I can now call friends.\nAfter my graduation, I didn't stop learning and improving, reaching the conclusion that I wanted to continue my studies, shifting my focus towards Finance.\nThis is another example of my curiosity, given that I have always been interested in the stock market, and while I hate to admit it, I was always curious about mathematics and statistics, numbers in general, but I never put in the effort to actually learn them. During my time at H-FARM College, I also had a blog, where I would post articles about what I thought would be the 'next move' on a stock, along with my trades, asking on my specialized profile on Instagram through stories which tickers my readers wanted me to give an opinion on.\n\nMy journey went on with my realization of what I imagined my future to be, and when asked 'what do you want to do in your life?' the answer was always 'I want to be a trader, an analyst, someone who is engaged in the markets.' So the topic of my Master's was clear. I enrolled at the University of Padua, after applying to various American Universities, because, and I will be forever thankful for this, of my Mathematics Professor at H-FARM College who told me that with my level of Mathematics it would have been quite hard for me to follow the lectures. He was most definitely right, I studied High School and Bachelor's level Maths for an undefined period of time prior to the start of the MSc. Day and night, Khan Academy and the MIT OpenCourseWare became my best friends, and I started to understand the beauty of Mathematics.\nI am currently wrapping up my MSc in Computational Finance, while actively reshaping the way data drives innovation in my mind. I am always hungry for new opportunities to learn, grow and develop my skills. I never stopped working as a Flutter Developer and I will never have the words to thank my colleagues and bosses enough for the trust, opportunities, support, and friendship they are giving me.\nThe coursework of my Master's allows me to delve into stochastic calculus, probability theory, numerical analysis/simulation/optimization and a concrete and quantitative approach on abstract models (relevant coursework is available on my CV, furthermore, the full course details are available on the official website of University of Padua).\n\nMy journey is fueled by the belief that innovation thrives at the crossroads of different disciplines, youthful energy, and relentless drive. Whether I'm streamlining code to slice precious milliseconds off runtime or trying to decipher the dynamic relationships between financial metrics, I'm on a mission to transform challenges into opportunities, and opportunities into success.\n\nThis website isn't just a portfolio or showcase of my work, it's a living testament of my commitment to precision, speed, and excellence.\n\nAcademics, professionals, and friends alike are invited to explore my projects, insights, and experiments that lie at the intersection of technology, finance, and data science.\n\nThank you for stopping by!",
                      style: TTheme.subText,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: Constants.padding),
                    InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      mouseCursor: SystemMouseCursors.none,
                      onTap: () {
                        if (SessionManager().user == null) {
                          CustomToast.errorToast(
                              "You need to be signed in to download my CV.");
                          return;
                        } else {
                          launchUrlString(Constants.cvUrlString);
                        }
                      },
                      child: Container(
                        height: 44,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Constants.accentColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.smallPadding),
                          child: Center(
                            child: Text(
                              "Download CV",
                              style: TTheme.directoryTextSelected,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Me',
              style: TTheme.displayText,
            ),
            const SizedBox(height: Constants.largePadding),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: ScreenSize.width!,
                    maxHeight: ScreenSize.height != null
                        ? ScreenSize.height! * 0.5
                        : 500),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/png/yearbook.jpg",
                        width: ScreenSize.width! * 0.75,
                      ),
                      const SizedBox(height: Constants.padding),
                      Text(
                        "Welcome! I am Tommaso Zanatta, as you could have already guessed by now. \n\nI should start from the beginning. I have always been a curious person, always asking questions and with lots of interests. I graduated from the I.T.I.S. Einaudi-Scarpa in Montebelluna, where my coursework was focused on International Relations and Marketing. I then moved to the amazing Ca'Tron, where I enrolled in the Digital Management Bachelor's of Science at H-FARM College. I had the opportunity to study in a multicultural and diverse environment, parallel to the continuously evolving and technologically advanced campus. \nMy dissertation was about the impact of AI-powered Chatbots (focused on Generative Pre-Trained transformers) on the supply chain management, more specifically on how they can streamline processes.\nDuring my time at H-FARM College, I was also continuously developing my programming knowledge, being passionate about Python from the early years of High School, I then moved on to Dart, because I was fascinated about the process of actually creating something tangible, like a mobile app.\nI had, almost by chance, the opportunity to start working as a Flutter Developer during summer, where I started the process of improvement that led me to the current state of my knowledge in this domain. During the third year of my Bachelor's, I continued working at the same company, getting to know better the colleagues who I can now call friends.\nAfter my graduation, I didn't stop learning and improving, reaching the conclusion that I wanted to continue my studies, shifting my focus towards Finance.\nThis is another example of my curiosity, given that I have always been interested in the stock market, and while I hate to admit it, I was always curious about mathematics and statistics, numbers in general, but I never put in the effort to actually learn them. During my time at H-FARM College, I also had a blog, where I would post articles about what I thought would be the 'next move' on a stock, along with my trades, asking on my specialized profile on Instagram through stories which tickers my readers wanted me to give an opinion on.\n\nMy journey went on with my realization of what I imagined my future to be, and when asked 'what do you want to do in your life?' the answer was always 'I want to be a trader, an analyst, someone who is engaged in the markets.' So the topic of my Master's was clear. I enrolled at the University of Padua, after applying to various American Universities, because, and I will be forever thankful for this, of my Mathematics Professor at H-FARM College who told me that with my level of Mathematics it would have been quite hard for me to follow the lectures. He was most definitely right, I studied High School and Bachelor's level Maths for an undefined period of time prior to the start of the MSc. Day and night, Khan Academy and the MIT OpenCourseWare became my best friends, and I started to understand the beauty of Mathematics.\nI am currently wrapping up my MSc in Computational Finance, while actively reshaping the way data drives innovation in my mind. I am always hungry for new opportunities to learn, grow and develop my skills. I never stopped working as a Flutter Developer and I will never have the words to thank my colleagues and bosses enough for the trust, opportunities, support, and friendship they are giving me.\nThe coursework of my Master's allows me to delve into stochastic calculus, probability theory, numerical analysis/simulation/optimization and a concrete and quantitative approach on abstract models (relevant coursework is available on my CV, furthermore, the full course details are available on the official website of University of Padua).\n\nMy journey is fueled by the belief that innovation thrives at the crossroads of different disciplines, youthful energy, and relentless drive. Whether I'm streamlining code to slice precious milliseconds off runtime or trying to decipher the dynamic relationships between financial metrics, I'm on a mission to transform challenges into opportunities, and opportunities into success.\n\nThis website isn't just a portfolio or showcase of my work, it's a living testament of my commitment to precision, speed, and excellence.\n\nAcademics, professionals, and friends alike are invited to explore my projects, insights, and experiments that lie at the intersection of technology, finance, and data science.\n\nThank you for stopping by!",
                        style: TTheme.subText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: Constants.padding),
                      Material(
                        color: Colors.transparent,
                        borderOnForeground: false,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          mouseCursor: SystemMouseCursors.none,
                          onTap: () {
                            if (SessionManager().user == null) {
                              CustomToast.errorToast(
                                  "You need to be signed in to download my CV.");
                              return;
                            } else {
                              launchUrlString(Constants.cvUrlString);
                            }
                          },
                          child: Container(
                            height: 44,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Constants.accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Constants.smallPadding),
                              child: Center(
                                child: Text(
                                  "Download CV",
                                  style: TTheme.directoryTextSelected,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
