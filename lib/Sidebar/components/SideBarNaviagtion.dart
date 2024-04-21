import 'dart:js';

import 'package:asset_management_app/utils/consnts.dart';
import 'package:flutter/material.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}


class SideBarNavigationButton extends StatelessWidget {
  const SideBarNavigationButton({
    required this.selected,
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              _buildIcon(context),
              const SizedBox(width: kSpacing / 2),
              Expanded(child: _buildLabel(context)),
              if (data.totalNotif != null)
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing / 2),
                  child: _buildNotif(),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Icon(
      (!selected) ? data.icon : data.activeIcon,
      size: 20,
      color: (!selected)
          ? kFontColorPallets[1]
          : Theme.of(context).primaryColor,
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      data.label,
      style: TextStyle(
        color: (!selected)
            ? kFontColorPallets[1]
            : Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: .8,
        fontSize: 14,
      ),
    );
  }

  Widget _buildNotif() {
    return (data.totalNotif == null || data.totalNotif! <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              (data.totalNotif! >= 100) ? "99+" : "${data.totalNotif}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
