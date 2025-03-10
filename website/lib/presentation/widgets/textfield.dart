import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website/presentation/cubits/custom_textfield/custom_textfield_cubit.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/texttheme_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.hintText, this.isPassword = false, super.key});
  final String? hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomTextfieldCubit(),
      child: BlocBuilder<CustomTextfieldCubit, CustomTextfieldState>(
        builder: (context, state) {
          bool isVisible = false;
          if (state is CustomTextfieldInitial) {
            isVisible = state.isVisible;
          }

          return Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: ScreenSize.width != null
                        ? ScreenSize.width! * 0.15
                        : 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state is CustomTextfieldError
                            ? Constants.failureColor
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: Constants.verySmallPadding,
                        left: Constants.verySmallPadding,
                        right: Constants.verySmallPadding,
                      ),
                      child: TextField(
                        obscureText: isPassword ? !isVisible : false,
                        mouseCursor: SystemMouseCursors.none,
                        style: TTheme.verySmallDisplayText,
                        onChanged: (value) {
                          context
                              .read<CustomTextfieldCubit>()
                              .realtimeValidation(value, false);
                        },
                        cursorColor: Constants.accentColor,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                          hintStyle: TTheme.smallDisplayTextBg,
                        ),
                      ),
                    ),
                  ),
                  if (isPassword)
                    IconButton(
                      onPressed: () {
                        context.read<CustomTextfieldCubit>().toggleVisibility();
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Constants.secondaryColor,
                      ),
                    ),
                ],
              ),
              if (state is CustomTextfieldError)
                Text(
                  state.message,
                  style: TTheme.smallTextError,
                  textAlign: TextAlign.left,
                ),
            ],
          );
        },
      ),
    );
  }
}
