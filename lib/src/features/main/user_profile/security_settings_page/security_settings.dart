import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_switch.dart';
import 'security_mixin.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> with SecurityMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08),
        child: const CustomAppBar(
          title: "Security",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
             Column(
               children: List.generate(
                 security.length,
                     (index) => CustomListTile(
                   title: security[index],
                   titleSize: 20,
                   onTap: () {
                     setState(() {
                       securityValue[index] = !securityValue[index];
                     });
                   },
                   trailing: CustomSwitch(
                     value: securityValue[index],
                     onChanged: (bool value) {
                       setState(() {
                         securityValue[index] = value;
                       });
                     },
                   ),
                 ),
               ),
             ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                onPressed: (){},
                text: "Change PIN",
                size: Size(
                  double.infinity,
                  size.height * 0.07,
                ),
                color: const Color(0xFFE9F0FF),
                textColor: const Color(0xFF246BFD),
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              CustomButton(
                onPressed: (){},
                text: "Change Password",
                size: Size(
                  double.infinity,
                  size.height * 0.07,
                ),
                color: const Color(0xFFE9F0FF),
                textColor: const Color(0xFF246BFD),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
