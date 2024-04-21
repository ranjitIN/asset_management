import 'package:asset_management_app/Sidebar/components/PageButton.dart';
import 'package:asset_management_app/Sidebar/components/memberProfile.dart';
import 'package:asset_management_app/Sidebar/components/sidebarTaskButton.dart';
import 'package:asset_management_app/Sidebar/components/userProfile.dart';
import 'package:asset_management_app/provider/authProvider.dart';
import 'package:asset_management_app/provider/memberProvider.dart';
import 'package:asset_management_app/screens/Dashboard/DashBoardScreen.dart';
import 'package:asset_management_app/screens/Devices/DeviceScreen.dart';
import 'package:asset_management_app/screens/Settings/SettingsScreen.dart';
import 'package:asset_management_app/utils/consnts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../screens/Tickets/TicketsScreen.dart';

class CustomDesktopSideBar extends StatefulWidget {
  const CustomDesktopSideBar({
    super.key,
  });

  @override
  State<CustomDesktopSideBar> createState() => _CustomDesktopSideBarState();
}

class _CustomDesktopSideBarState extends State<CustomDesktopSideBar> {
  SideBarController controller = SideBarController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller._currentPath,
        builder: (context, value, child) => Column(
              children: [
                Consumer<AuthProvider>(
                    builder: (context, authProvider, child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: UserProfile(
                              data: authProvider.userData, onPressed: () {}),
                        )),
                SideBarNavigationButton(
                    selected: value == DashBoardScreen.screenPath,
                    data: SelectionButtonData(
                      activeIcon: EvaIcons.home,
                      icon: EvaIcons.homeOutline,
                      label: "Home",
                    ),
                    onPressed: () {
                      GoRouter.of(context).go(DashBoardScreen.screenPath);
                      controller.currentPath = DashBoardScreen.screenPath;
                    }),
                SideBarNavigationButton(
                    selected: value == DevicesScreen.screenPath,
                    data: SelectionButtonData(
                        activeIcon: EvaIcons.bell,
                        icon: EvaIcons.bellOutline,
                        label: "Devices"),
                    onPressed: () {
                      GoRouter.of(context).go(DevicesScreen.screenPath);
                      controller.currentPath = DevicesScreen.screenPath;
                    }),
                SideBarNavigationButton(
                    selected: value == TicketScreen.screenPath,
                    data: SelectionButtonData(
                        activeIcon: EvaIcons.checkmarkCircle2,
                        icon: EvaIcons.checkmarkCircle,
                        label: "Tickets",
                        totalNotif: 20),
                    onPressed: () {
                      GoRouter.of(context).go(TicketScreen.screenPath);

                      controller.currentPath = TicketScreen.screenPath;
                    }),
                SideBarNavigationButton(
                    selected: value == SettingsScreen.screenPath,
                    data: SelectionButtonData(
                        activeIcon: EvaIcons.settings,
                        icon: EvaIcons.settingsOutline,
                        label: "Settings",
                        totalNotif: 20),
                    onPressed: () {
                      GoRouter.of(context).go(SettingsScreen.screenPath);
                      controller.currentPath = SettingsScreen.screenPath;
                    }),
                const SizedBox(height: kSpacing),
                const Divider(
                  indent: 20,
                  thickness: 1,
                  endIndent: 20,
                  height: 60,
                ),
                Consumer<MemberProvider>(
                    builder: (context, memberProvider, child) => MemberList(
                        member: memberProvider.member, controller: controller)),
                const SizedBox(height: kSpacing),
                _TaskMenu(
                  onSelected: () {},
                  controller: controller,
                ),
                const SizedBox(height: kSpacing),
                Padding(
                  padding: const EdgeInsets.all(kSpacing),
                  child: Text(
                    "All Right Reserved @Team Therootbit",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ));
  }
}

class MemberList extends StatelessWidget {
  const MemberList({super.key, required this.member, required this.controller});
  final List<String> member;
  final int maxDisplayPeople = 2;
  final SideBarController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        (member.length > maxDisplayPeople) ? maxDisplayPeople : member.length,
        (index) => SimpleUserProfile(
          name: member[index],
          onPressed: () {
            //TODO: Navigate to member page and update the controller
          },
        ),
      ).toList(),
    );
  }
}

class _TaskMenu extends StatelessWidget {
  const _TaskMenu(
      {Key? key, required this.onSelected, required this.controller})
      : super(key: key);

  final Function onSelected;
  final SideBarController controller;

  @override
  Widget build(BuildContext context) {
    return SimpleSelectionButton(
      data: const [
        "Resolved",
        "Unresolved",
        "In Progress",
      ],
      onSelected: onSelected,
    );
  }
}

class SideBarController {
  ValueNotifier _currentPath =
      ValueNotifier<String>(DashBoardScreen.screenPath);
  get currentPath => _currentPath;
  set currentPath(value) {
    _currentPath.value = value;
  }
}
