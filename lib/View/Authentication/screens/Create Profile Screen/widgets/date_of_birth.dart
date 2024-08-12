import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rista_zoro_app/View%20Model/Create%20Screen%20ViewModel/create%20screen%20controller/create_profile_controller.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';

class DateOfBirth extends StatelessWidget {
  DateOfBirth({super.key});

  Future<void> _showDatePicker(
      BuildContext context, CreateProfileController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate:
          DateTime.now().subtract(Duration(days: 365 * 70)), // 70 years ago
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      controller.dataofBirth.value = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProfileController());

    return InkWell(
      onTap: () {
        _showDatePicker(context, controller);
      },
      child: AppCurvedContainer(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultSpace / 2),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(
                  width: AppSizes.defaultSpace / 1.5,
                ),
                Obx(
                  () => Text(
                    controller.dataofBirth.value == ""
                        ? "Date Of Birth"
                        : controller.dataofBirth.value,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// AppCurvedContainer(
// height: 100,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// children: [
// const Icon(Icons.calendar_today, color: Colors.grey),
// const SizedBox(width: AppSizes.spaceBtwItems),
// Expanded(
// child: AppCurvedContainer(
// isBorder: true,
// supportDark: false,
// backgroundColor: isDark ? AppColors.dark : AppColors.white,
// height: 55,
// child: TextFormField(
// controller: dateController,
// decoration: const InputDecoration(
// hintText: 'Date',
// border: InputBorder.none,
// ),
// keyboardType: TextInputType.number,
// inputFormatters: [
// FilteringTextInputFormatter.digitsOnly,
// LengthLimitingTextInputFormatter(2),
// ],
// ),
// ),
// ),
// const SizedBox(width: AppSizes.spaceBtwItems),
// Expanded(
// child: AppCurvedContainer(
// supportDark: false,
// isBorder: true,
// height: 55,
// backgroundColor: isDark ? AppColors.dark : AppColors.white,
// child: TextFormField(
// controller: monthController,
// decoration: const InputDecoration(
// hintText: 'Month',
// border: InputBorder.none,
// ),
// keyboardType: TextInputType.number,
// inputFormatters: [
// FilteringTextInputFormatter.digitsOnly,
// LengthLimitingTextInputFormatter(2),
// ],
// ),
// ),
// ),
// const SizedBox(width: AppSizes.spaceBtwItems),
// Expanded(
// child: AppCurvedContainer(
// supportDark: false,
// isBorder: true,
// height: 55,
// backgroundColor: isDark ? AppColors.dark : AppColors.white,
// child: TextFormField(
// controller: yearController,
// decoration: const InputDecoration(
// hintText: 'Year',
// border: InputBorder.none,
// ),
// keyboardType: TextInputType.number,
// inputFormatters: [
// FilteringTextInputFormatter.digitsOnly,
// LengthLimitingTextInputFormatter(4),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// );
