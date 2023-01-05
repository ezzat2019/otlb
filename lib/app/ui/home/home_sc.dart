import 'package:flutter/material.dart';
import 'package:otlb/app/provider/home_provider.dart';
import 'package:otlb/app/utils/constants.dart';
import 'package:otlb/main.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class HomeSc extends StatefulWidget {
  const HomeSc({Key? key}) : super(key: key);

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Directionality(
          textDirection: value.textDirection,
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.current.home),
            ),
            body: Column(
              children: [],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                homeProvider.changeLang();
              },
              child: FittedBox(
                  child: Text(value.textDirection == TextDirection.rtl
                      ? Constants.EN
                      : Constants.AR)),
            ),
          ),
        );
      },
    );
  }

  void init() {
    homeProvider = Provider.of<HomeProvider>(myContext!);
    homeProvider.init();
  }
}
