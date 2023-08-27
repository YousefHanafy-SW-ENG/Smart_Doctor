import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/uitls/app_colors.dart';
import '../../../../core/uitls/image_manager.dart';

class ToggleLanguageButton extends StatelessWidget {
  const ToggleLanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = context.read<LoginCubit>();
        return SizedBox(
          width: context.width * 0.4,
          child: InkWell(
            onTap: () async {
              if (myCubit.flagImage == ImageManager.egypt) {
                await context.setLocale(
                  const Locale('ar'),
                );
              } else {
                await context.setLocale(
                  const Locale('en'),
                );
              }
              myCubit.toggleLanguage();
            },
            child: Padding(
              padding: EdgeInsets.only(right: context.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: context.height * 0.05,
                    width: context.width * 0.2,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(myCubit.flagImage),
                      ),
                    ),
                  ),
                  Text(
                    myCubit.toggleText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}




       // return DropdownButton(
        //   underline: const SizedBox(),
        //   value: items[myCubit.languageIndex],
        //   items: items.map((items) {
        //     return DropdownMenuItem(
        //       value: items,
        //       child: items,
        //     );
        //   }).toList(),
        //   onTap: () {},
        //   onChanged: (value) async {
        //     if (myCubit.languageIndex == 0) {
        //       LoginCubit().getCubit(context).languageIndex = 1;
        //       await context.setLocale(
        //         const Locale('ar'),
        //       );
        //     } else {
        //       myCubit.languageIndex = 0;
              // await context.setLocale(
              //   const Locale('en'),
              // );
        //       myCubit.toggleLanguage();
        //     }
        //   },
        // );