import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/data/repository/message_repository.dart';
import '../../../../common/data/repository/notification_repository.dart';
import '../../../../common/services/storage/storage.dart';
import '../../help_center/customer_service/widgets/custom_text_field.dart';
import '/src/common/model/message_model.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_screen_app_bar.dart';

//  "dKbsgpiiZk11lhpX2JIKCF:APA91bFhjkr2zmF8kCEIucnCEVP2hebG6vkCy"
//             "8aH_cGlCKG7ebeLv3nJRYvUa7R9upEjfbkP8o8I3tv2mJ8RuIzOBtkj"
//             "-V5NcIy7-O93Aszkx1r62rIzHhJZSl_Sdl-j6b3UCMX0FjhP",

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IMessageRepository repository;
  late INotificationRepository notificationRepository;
  late TextEditingController textEditingController;

  bool isTexting = false;

  @override
  void initState() {
    repository = MessageRepository($currentUser.currentUser!.id);
    notificationRepository = NotificationRepository();
    textEditingController = TextEditingController();
    super.initState();
  }

  Future<void> sendMessage() async {
    final message = MessageModel(
      userId: $currentUser.currentUser!.id,
      message: textEditingController.text.trim(),
      usersId: $currentUser.currentUser!.id,
    );
    if (textEditingController.text.isNotEmpty) {
      repository.createMessage(message);

      // notificationRepository.postNotification(
      //   message: textEditingController.text.trim(),
      //   token: ,
      //   name: AuthService.auth.currentUser!.displayName!,
      //  );
    }
    textEditingController.text = "";
    setState(() {
      isTexting = false;
    });
  }

  // void editPost(MessageModel message) async {
  //   final editMessage = MessageModel(
  //     userId: message.userId,
  //     usersId: $currentUser.currentUser!.id,
  //     message: textEditingController.text == ""
  //         ? message.message
  //         : textEditingController.text,
  //     id: message.id,
  //     edited: true,
  //   );
  //
  //   await repository.updateMessage(editMessage);
  //
  //   if (context.mounted) {
  //     Navigator.pop(context);
  //   }
  //
  //   textEditingController.text = "";
  // }

  // Future<void> deletePost(String id) async {
  //   await repository.deleteMessage(id);
  //
  //   if (context.mounted) {
  //     Navigator.pop<bool>(context, true);
  //   }
  // }

  /// AppBar Function
  void backTap() {
    Navigator.pop(context);
  }

  void searchTap() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.23,
        ),
        child: ChatScreenAppBar(
          backTap: backTap,
          title: 'Dr.Drake Boeson',
          searchTap: searchTap,
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
                final post = MessageModel.fromJson(
                  Map<String, Object?>.from(snapshot.value as Map),
                );

                return post.message != null
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.5,
                          minWidth: size.width * 0.5,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 10),
                          child: Align(
                            alignment:
                                post.userId != $currentUser.currentUser!.id
                                    ? Alignment.bottomLeft
                                    : Alignment.bottomRight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(15),
                                  bottomLeft: post.userId !=
                                          $currentUser.currentUser!.id
                                      ? const Radius.circular(0)
                                      : const Radius.circular(15),
                                  topRight: const Radius.circular(15),
                                  bottomRight: post.userId !=
                                          $currentUser.currentUser!.id
                                      ? const Radius.circular(15)
                                      : const Radius.circular(0),
                                ),
                                border: Border.all(
                                  color: post.userId !=
                                          $currentUser.currentUser!.id
                                      ? Colors.black
                                      : const Color(0xFF21C004),
                                  width: 0.2,
                                ),
                                color:
                                    post.userId != $currentUser.currentUser!.id
                                        ? const Color(0xFFF5F5F5)
                                        : const Color(0xFFE1FEC6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: post.userId !=
                                          $currentUser.currentUser!.id
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      post.message ?? "",
                                      style: TextStyle(
                                        color: post.userId !=
                                                $currentUser.currentUser!.id
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          post.edited! ? "edited" : "",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: post.userId !=
                                                    $currentUser.currentUser!.id
                                                ? Colors.black
                                                : const Color(0xFF2DA430),
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          " ${"${post.createAt.hour}".padLeft(2, "0")}:${"${post.createAt.minute}".padLeft(2, "0")}",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: post.userId !=
                                                    $currentUser.currentUser!.id
                                                ? Colors.black
                                                : const Color(0xFF2DA430),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
            child: Padding(
              padding: const EdgeInsets.all(5),
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
                      onPressed: sendMessage,
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
          ),
        ],
      ),
    );
  }
}
