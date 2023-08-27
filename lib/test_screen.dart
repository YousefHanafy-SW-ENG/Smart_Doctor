import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/medical_report/presentation/cubit/medical_report_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/features/signup/presentation/widgets/empty_elivated_container.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = MedicalReportCubit.getCubit(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuildDoubleElement(
            text: LocaleKeys.uploadYourId.tr(),
            secoundWidget: EmptyElivatedContainer(
              press: () {
                myCubit.pickIdImages();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    color: AppConstants.isCurrentThemeDark
                        ? AppColors.white
                        : AppColors.darkBlack,
                  ),
                  Text(
                    LocaleKeys.uploadPhoto.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          if (myCubit.idImage != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                height: context.height * 0.13,
                width: context.width * 0.5,
                child: Image(
                  image: Image.file(
                    myCubit.idImage!,
                    color: AppColors.white,
                  ).image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          TextButton(
            onPressed: () {
              MedicalReportCubit.getCubit(context).sendImageToApi();
            },
            child: const Text('Send image '),
          ),
          // Text(myCubit.idInformationModel!.adress.toString()),
          // Text(myCubit.idInformationModel!.name.toString()),
          // Text(myCubit.idInformationModel!.ssn.toString()),
          Text(MedicalReportCubit.getCubit(context).response),
        ],
      ),
    );
  }
}
