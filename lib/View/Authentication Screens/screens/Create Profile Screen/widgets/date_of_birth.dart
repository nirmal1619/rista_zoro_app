import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/extented_able_container.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../../View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';

class DateOfBirth extends StatelessWidget {
  const DateOfBirth({super.key});

  Future<void> _showDatePicker(
      BuildContext context, CreateProfileController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now()
          .subtract(const Duration(days: 365 * 70)), // 70 years ago
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      controller.dataofBirth.value = formattedDate;
      controller.isDateAvailable.value = true;
      controller.showDateError.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateProfileController>();

    return InkWell(
      onTap: () {
        _showDatePicker(context, controller);
      },
      child: SizedBox(
        height: 55,
        child: ExtenedAbleContainer(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace / 2),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(
                    width: AppSizes.defaultSpace / 1.5,
                  ),
                  Obx(
                    () => controller.showDateError.value
                        ? const Text(
                            "Enter Date Of Birth",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          )
                        : Text(
                            controller.dataofBirth.value == ""
                                ? "Date Of Birth"
                                : controller.dataofBirth.value,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                  )
                ],
              ),
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
