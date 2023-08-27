import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/decorated_text_in_container.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';

import '../../../login/presentation/widgets/height_seperator.dart';

class InsuranceTab extends StatelessWidget {
  const InsuranceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        //profile image
        const HeightSeperator(),

        BuildDoubleElement(
          text: LocaleKeys.insuranceName.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Medical Insurance ',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.insuranceCompany.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Shadi Systems Company',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.insuranceCompany.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Shadi Systems Company',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.insuranceId.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '20130313',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.insuranceLevel.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Insurance Leveeeel',
          ),
        ),
      ],
    );
  }
}
