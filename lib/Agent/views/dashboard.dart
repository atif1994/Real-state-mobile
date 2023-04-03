import 'package:flutter/material.dart';
import 'package:prologic_29/custom_widgets/drawer_widget.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/fonts.dart';
import '../../utils/styles/app_textstyles.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: AgentDrawer(
              fname: 'Sohaib',
              lname: 'Zakir',
              email: 'sohaibzakir@gmail.com',
              loginBaseImage: ''),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: AppColors.appthem,
                    // leading: IconButton(
                    //     onPressed: () {}, icon: const Icon(Icons.dashboard)),
                    expandedHeight: 15.0.h,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Dashboard",
                        style: AppTextStyles.heading1
                            .copyWith(fontFamily: AppFonts.nexaRegular),
                      ),
                    ),
                    floating: true,
                    snap: true,
                    pinned: true,
                  ),
                ];
              },
              body: const SingleChildScrollView())),
    );
  }
}
