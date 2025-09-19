import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/theme_provider.dart';

class CustomListview extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged<String> onTapItem;
  const CustomListview({
    super.key,
    required this.items,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return const SizedBox.shrink(); // 마지막 Divider
        } else if (items[index] is String) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              items[index],
              style: TextStyle(
                fontSize: 16,
                color: Provider.of<ThemeProvider>(context).isDarkMode()
                    ? Colors.white
                    : Colors.black,
                fontFamily: 'NotoSansCJKKR',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              onTapItem(items[index]);
            },
            minVerticalPadding: 23, // 높이 조정
          );
        } else if (items[index] is MapEntry &&
            items[index].key is MapEntry &&
            items[index].key.key is String &&
            items[index].key.value is String) {
          String main = items[index].key.key;
          String sub = items[index].key.value;
          bool isHorizontal = items[index].value;

          if (isHorizontal) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    main,
                    style: TextStyle(
                      fontSize: 16,
                      color: Provider.of<ThemeProvider>(context).isDarkMode()
                          ? Colors.white
                          : Colors.black,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              minVerticalPadding: 23, // 높이 조정
            );
          } else {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                main,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              subtitle: Text(
                sub,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              minVerticalPadding: 23, // 높이 조정
            );
          }
        } else if (items[index].value is bool && items[index].value) {
          // Label
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Text(
                items[index].key,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 145, 234, 1),
                ),
              ),
              const SizedBox(height: 7),
            ],
          );
          // const SizedBox(height: 35);
          // Text(
          //   items[index].key,
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontWeight: FontWeight.bold,
          //     color: Color.fromRGBO(0, 145, 234, 1),
          //   ),
          // );
          // const SizedBox(height: 7);
          // return Text(
          //   items[index].key,
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontWeight: FontWeight.bold,
          //     color: Color.fromRGBO(0, 145, 234, 1),
          //   ),
          // );
        } else {
          return const SizedBox.shrink();
        }
        // return null;
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Provider.of<ThemeProvider>(context).isDarkMode()
              ? Color.fromRGBO(0xe0, 0xe0, 0xe0, 1)
              : Color.fromRGBO(0x61, 0x61, 0x61, 1),
          thickness: 1,
          height: 1,
        );
      },
      itemCount: items.length + 1, // 마지막 라인
      scrollDirection: Axis.vertical,
    );
  }
}
