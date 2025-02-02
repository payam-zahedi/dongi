import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/list_tile/list_tile_card.dart';

class FriendsListWidget {
  friendsList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListTileCard(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorConfig.primarySwatch,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                trailing: Text(
                  '\$53',
                  style: FontConfig.body2(),
                ),
                titleString: 'friend name',
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
