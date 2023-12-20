import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/data/repository/message_repository.dart';
import '../../../../common/services/storage/storage.dart';
import '/src/common/model/message_model.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_text_field.dart';
import 'widgets/customer_service_app_bar.dart';

class CustomerServiceScreen extends StatefulWidget {
  final String chatPath;

  const CustomerServiceScreen({
    required this.chatPath,
    super.key,
  });

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  late IMessageRepository repository;
  late TextEditingController textEditingController;
  late String chatPath;

  bool isTexting = false;

  void backTap() {
    Navigator.pop(context);
  }

  void phoneTap() {}

  @override
  void initState() {
    repository = MessageRepository(widget.chatPath);
    textEditingController = TextEditingController();
    super.initState();
  }

  Future<void> deletePost(String id) async {
    await repository.deleteMessage(id);

    if (context.mounted) {
      Navigator.pop<bool>(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.23,
        ),
        child: CustomerServiceAppBar(
          backTap: backTap,
          title: 'Customer Service',
          phoneTap: phoneTap,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: FirebaseAnimatedList(
              reverse: true,
              sort: (a, b) {
                final aValue = MessageModel.fromJson(
                  Map<String, Object?>.from(a.value as Map),
                );

                final bValue = MessageModel.fromJson(
                  Map<String, Object?>.from(b.value as Map),
                );

                return bValue.createAt.compareTo(aValue.createAt);
              },
              query: repository.queryMessage(),
              itemBuilder: (context, snapshot, animation, index) {
                final message = MessageModel.fromJson(
                  Map<String, Object?>.from(snapshot.value as Map),
                );

                return message.message != null
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.5,
                          minWidth: size.width * 0.5,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 10),
                          child: Align(
                            alignment: message.userId !=
                                $currentUser.currentUser!.id
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 12,
            right: 6,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: CustomTextField(
                      onChanged: (text) {
                        setState(() {
                          textEditingController.text.isNotEmpty
                              ? isTexting = true
                              : isTexting = false;
                        });
                      },
                      textEditingController: textEditingController,
                      check: isTexting,
                    ),
                  ),

                  IconButton(
                    iconSize: 56,
                    onPressed: () {},
                    icon: isTexting
                        ? Image(
                            width: 56,
                            height: 56,
                            image: const AssetImage(
                              "assets/icons/ic_send_message.png",
                            ),
                            color: !isTexting
                                ? AppColors.greyScale
                                : AppColors.blue,
                          )
                        : CircleAvatar(
                            minRadius: 25,
                            backgroundColor: AppColors.blue,
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.icVoice,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
