import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/views/home/home_viewmodel.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.model,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: model.textController,
      onSaved: (value) {},
      keyboardAppearance: theme.brightness,
      onFieldSubmitted: (value) => model.saveSearch(context),
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
        FilteringTextInputFormatter.allow(RegExp('[+0-9]')),
      ],
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 3.h, 8.w, 2.h),
          child: Container(
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () => model.saveSearch(context),
              child: Icon(
                CupertinoIcons.search,
                size: 20,
                color: theme.iconTheme.color,
              ),
            ),
          ),
        ),
        suffixIconColor: theme.iconTheme.color,
        focusColor: theme.iconTheme.color,
        hintText: 'Add a phone number...',
        hintStyle: textTheme.subtitle1!.copyWith(color: const Color(0xFF6B6F7A)),
        contentPadding: EdgeInsets.fromLTRB(15.w, 24.h, 15.w, 18.h),
        filled: true,
        fillColor: theme.colorScheme.background,
        border: kTextInputBorder,
        enabledBorder: kTextInputBorder,
        disabledBorder: kTextInputBorder,
        focusedBorder: kTextInputBorder,
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
