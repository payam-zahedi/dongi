import 'package:dongi/constants/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../controller/group_controller.dart';
import 'group_list_widget.dart';

class GroupListPage extends ConsumerWidget with GroupListWidget {
  GroupListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupList = ref.watch(getGroupsProvider);
    return Scaffold(
      appBar: AppBarWidget(title: "Groups"),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () => context.push(RouteNameConfig.createGroup),
      ),
      body: groupList.when(
        //skipLoadingOnRefresh: true,
        //skipLoadingOnReload: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (data) => RefreshIndicator(
          child: groupListView(groupModel: data, ref: ref, context: context),
          onRefresh: () => ref.refresh(refreshGroupsProvider.future),
        ),
      ),
    );
  }
}
