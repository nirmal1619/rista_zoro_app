import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rista_zoro_app/Backend/Api%20Repository/create_profile_repo.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Create%20Profile%20Screen/widgets/create_profile_form.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Create%20Profile%20Screen/widgets/term_and_policy_row.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../Backend/Api Model/create account model/create_account_model.dart';
import '../../../../common/widgets/Buttons/app_elevated_button.dart';
import '../../../../utils/helpers/show_snackbar.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppAppbar(
        leadingIcon: CupertinoIcons.search,
        title: Text(
          AppTexts.createProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
        actions: [
          TextButton(onPressed: () {}, child: const Text("${AppTexts.login} ?"))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ///-- form
              CreateProfileForm(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              const Divider(),

              //term and policy
              const TermsAndPolicyRow(),

              const SizedBox(height: AppSizes.spaceBtwItems),
              AppElevatedButton(
                onPressed: () async {
                  // Construct the account model with the necessary values
                  final accountModel = CreateAccountModel(
                    aldFname: 'John',
                    aldLname: 'Doe',
                    dob: '1990-01-01',
                    gender: 'Male',
                    religion: 'Christianity',
                    motherTongue: 'English',
                    aldPassword: 'securePassword123',
                    phone: "7312949411",
                    aldEmail: 'john.doe@example.com',
                  );

                  // Create the repository instance
                  final createProfileRepo = CreateProfileRepo();

                  try {
                    // Call the createAccount method with the model
                    final response =
                        await createProfileRepo.createAccount(accountModel);

                    // Handle the response
                    if (response != null) {
                      print('Account created successfully: $response');
                    } else {
                      print('Failed to create account: No response received.');
                    }
                  } catch (e, stackTrace) {
                    // Handle and log the error
                    log('Error: $e');
                    log('Stack trace: $stackTrace');

                    // Show error message in a Snackbar
                    ShowSnackbar.errorMessage('Failed to create account', '$e');
                  }
                },
                buttonName: AppTexts.createProfile,
              )
            ],
          ),
        ),
      ),
    );
  }
}
