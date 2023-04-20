import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/double_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;
  // 命名可选参数，设置默认值
  const HYOperationItem(this._icon, this._title, {Key? key, this.textColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.px,
      padding: EdgeInsets.symmetric(vertical: 15.0.px),
      color: Colors.transparent,  // 不加这个颜色 点击范围不会随着padding变大
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 3.0.px),  // 让他们之间有点小小的间隔
          Text(
            _title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
