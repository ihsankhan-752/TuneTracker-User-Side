import 'package:flick_radio/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../model/show_model.dart';
import '../../../../theme/text_styles.dart';

class OurShowCard extends StatelessWidget {
  final ShowModel showModel;
  const OurShowCard({super.key, required this.showModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(showModel.image),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(showModel.title, style: AppTextStyles.heading1.copyWith(color: AppColors.mainColor)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.edit, size: 15, color: AppColors.mainColor),
                      ),
                      const SizedBox(width: 08),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Show Title',
                            style: AppTextStyles.heading3.copyWith(fontSize: 10, color: AppColors.primaryGrey),
                          ),
                          const SizedBox(height: 02),
                          Text(
                            showModel.title,
                            style: AppTextStyles.heading3.copyWith(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.schedule, size: 15, color: AppColors.mainColor),
                      ),
                      const SizedBox(width: 08),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Show Time',
                            style: AppTextStyles.heading3.copyWith(fontSize: 12, color: AppColors.primaryGrey),
                          ),
                          const SizedBox(height: 02),
                          Text(
                            showModel.timeAndDate,
                            style: AppTextStyles.heading3.copyWith(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.location_on_outlined, size: 15, color: AppColors.mainColor),
                      ),
                      const SizedBox(width: 08),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: AppTextStyles.heading3.copyWith(fontSize: 12, color: AppColors.primaryGrey),
                          ),
                          const SizedBox(height: 02),
                          Text(
                            showModel.showLocation,
                            style: AppTextStyles.heading3.copyWith(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: AppColors.mainColor, thickness: 0.8),
      ],
    );
  }
}
