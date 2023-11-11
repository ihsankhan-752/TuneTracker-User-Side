import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class OurShowWidget extends StatelessWidget {
  final dynamic data;
  final Function()? onPressed;
  const OurShowWidget({Key? key, this.onPressed, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: Colors.grey.withOpacity(0.5),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(08),
              image: DecorationImage(
                image: NetworkImage(data['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            data['title']!,
            style: TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
            ),
          ),
          trailing: Text(
            data['showTime'],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            data['description'],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
