import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'create_box_widget.dart';

class CreateBoxPage extends HookConsumerWidget with CreateBoxWidget {
  final String groupId;
  CreateBoxPage(this.groupId, {super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxTitle = useTextEditingController();
    final boxDescription = useTextEditingController();
    final image = useState<File?>(null);

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Create Box"),
      body: Column(
        children: [
          boxInfoCard(
            context: context,
            image: image,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            formKey: _formKey,
            ref: ref,
          ),
          selectFriendsCard(context),
          const Spacer(),
          createButton(
            ref: ref,
            context: context,
            formKey: _formKey,
            image: image,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            groupId: groupId,
          ),
        ],
      ),
    );
  }
}
