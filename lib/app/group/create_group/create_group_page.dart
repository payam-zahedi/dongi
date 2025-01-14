import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'create_group_widget.dart';

class CreateGroupPage extends HookConsumerWidget with CreateGroupWidget {
  CreateGroupPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupTitle = useTextEditingController();
    final groupDescription = useTextEditingController();
    final image = useState<File?>(null);

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Create Group"),
      body: Column(
        children: [
          groupInfoCard(
            context: context,
            image: image,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
            formKey: _formKey,
            ref: ref,
          ),
          addFriendsCard(context),
          const Spacer(),
          createButton(
            ref: ref,
            context: context,
            formKey: _formKey,
            image: image,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
          ),
        ],
      ),
    );
  }
}
