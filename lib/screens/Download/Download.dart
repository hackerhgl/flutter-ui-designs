import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:flutter_uis/screens/Download/messages/keys.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/DownloadBody.dart';
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        Navigator.popUntil(
          context,
          (route) =>
              route.settings.name != ModalRoute.of(context)!.settings.name,
        );
        return false;
      },
      child: Screen(
        belowBuilders: [
          MirrorAnimationBuilder(
            tween: ColorTween(
              begin: AppTheme.primary.withOpacity(0.15),
              end: AppTheme.primary.withOpacity(1.0),
            ),
            duration: Duration(milliseconds: 2400),
            builder: (context, animation, child) {
              return Positioned(
                bottom: AppDimensions.ratio * -10 +
                    MediaQuery.of(context).padding.bottom,
                right: AppDimensions.ratio * 5,
                child: Icon(
                  MaterialCommunityIcons.cloud_download_outline,
                  size: AppDimensions.ratio * 100,
                  color: animation,
                ),
              );
            },
          )
        ],
        child: Column(
          children: [
            Header(
              label: App.translate(DownloadScreenMessages.title, context),
            ),
            SizedBox(height: AppDimensions.padding * 3),
            Expanded(
              child: Container(
                width: AppDimensions.maxContainerWidth,
                child: DownloadBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
