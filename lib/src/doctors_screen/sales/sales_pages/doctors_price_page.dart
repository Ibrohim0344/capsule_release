import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/context_utils.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../../finance/widgets/simple_appbar.dart';

class DoctorsPricePage extends StatefulWidget {
  const DoctorsPricePage({super.key});

  @override
  State<DoctorsPricePage> createState() => _DoctorsPricePageState();
}

class _DoctorsPricePageState extends State<DoctorsPricePage> {
  late final TextEditingController price;
  late final TextEditingController discount;
  late final TextEditingController sellerPrice;
  late final TextEditingController capsuleCommission;

  @override
  void initState() {
    price = TextEditingController();
    discount = TextEditingController();
    sellerPrice = TextEditingController();
    capsuleCommission = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    price.dispose();
    discount.dispose();
    sellerPrice.dispose();
    capsuleCommission.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Save Price",
        // onTap: () => onTap(number),
        onTap: () {},
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          size.height * 0.06,
        ),
        child: const SimpleAppBar(
          text: "Doctor’s price",
          isBack: true,
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          Map<TextEditingController, String> prices = {
            price: "Your Price for 5 minuteis",
            discount: "Discount %",
            sellerPrice: "Seller Price",
            capsuleCommission: "Capsule’s commission 15%",
          };

          sellerPrice.text.isNotEmpty
              ? sellerPrice.text =
                  "${int.parse(price.text.trim()) - int.parse(price.text.trim()) / int.parse(discount.text.trim())}"
              : "";

          // final onChange = ChangedHint(
          //   controller: prices.keys.toList().removeAt(index),
          //   name: "%",
          // );
          return _CustomTextField(
            // onChanged: onChange.onChanged,
            textEditingController: prices.keys.toList().removeAt(index),
            hintText: prices.values.toList().removeAt(index),
          );
        },
      ),
    );
  }
}

class ChangedHint {
  final String name;
  final TextEditingController controller;

  const ChangedHint({
    required this.controller,
    required this.name,
  });

  void onChanged(String value) {
    if (value.isNotEmpty && !value.contains(name)) {
      controller.text = controller.text.replaceAll(name, "");
      controller.text = "${controller.text.trim()} $name";
    }
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;

  const _CustomTextField({
    required this.textEditingController,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10,
      ),
      child: SizedBox(
        height: 60,
        child: TextField(
          onChanged: onChanged,
          controller: textEditingController,
          textInputAction: TextInputAction.done,
          cursorColor: AppColors.mainColor,
          keyboardType: TextInputType.number,
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 2,
              ),
            ),
            // focusColor: AppColors.mainColor,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: AppColors.mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
