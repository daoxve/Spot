import 'package:spot/core/utils/exports.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.textController,
    required this.onFieldSubmitted,
    required this.suffixIconFunction,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final TextEditingController textController;
  final void Function(String)? onFieldSubmitted;
  final void Function()? suffixIconFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onSaved: (value) {},
      keyboardAppearance: theme.brightness,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 3.h, 8.w, 2.h),
          child: GestureDetector(
            onTap: suffixIconFunction,
            child: Container(
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                CupertinoIcons.search,
                size: 20.sp,
                color: theme.iconTheme.color,
              ),
            ),
          ),
        ),
        suffixIconColor: theme.iconTheme.color,
        focusColor: theme.iconTheme.color,
        hintText: 'Add a website URL...',
        hintStyle: textTheme.subtitle1!.copyWith(color: const Color(0xFF6B6F7A)),
        contentPadding: EdgeInsets.fromLTRB(15.w, 24.h, 15.w, 18.h),
        filled: true,
        fillColor: theme.colorScheme.background,
        border: kTextInputBorder,
        enabledBorder: kTextInputBorder,
        disabledBorder: kTextInputBorder,
        focusedBorder: kTextInputBorder,
      ),
      keyboardType: TextInputType.url,
    );
  }
}
