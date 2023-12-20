import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_list_tile.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<String> languages = [
    "Uzbek(UZ)",
    "English(UK)",
    "Russian(RU)",
  ];

  String selected = "";

  void radioState(String? value) {
    setState(() {
      selected = value ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: const CustomAppBar(
          title: "Language",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Suggested",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    languages.length,
                    (index) => CustomListTile(
                      onTap: () => radioState(
                        languages[index],
                      ),
                      trailing: Radio<String>(
                        value: languages[index],
                        groupValue: selected,
                        onChanged: radioState,
                        fillColor: MaterialStateProperty.all<Color>(
                          AppColors.blue,
                        ),
                      ),
                      title: languages[index],
                    ),
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
