import 'package:spot/core/utils/exports.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: _ConfirmationDialogContent(
        request: request!,
        completer: completer!,
      ),
    );
  }
}

class _ConfirmationDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const _ConfirmationDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: getValueForScreenType<double?>(
            context: context,
            mobile: null,
            tablet: 320.0,
            desktop: 320.0,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 12.0),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap.smallH,
              Text(
                request.title ?? '',
                style: textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Gap.smallH,
              Text(
                request.description ?? '',
                style: textTheme.headline6!.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Gap.mediumH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null) ...{
                    TextButton(
                      onPressed: () => completer(
                        DialogResponse(confirmed: false),
                      ),
                      child: Text(
                        request.secondaryButtonTitle!,
                        style: textTheme.subtitle1!.copyWith(
                          color: theme.iconTheme.color!.withOpacity(0.8),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  },
                  TextButton(
                    onPressed: () => completer(
                      DialogResponse(confirmed: true),
                    ),
                    child: Text(
                      request.mainButtonTitle!,
                      style: textTheme.subtitle1!.copyWith(
                        color: kcError,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -28.0,
          child: CircleAvatar(
            minRadius: 16.0,
            maxRadius: 28.0,
            backgroundColor: _getStatusColor(request.customData),
            child: Icon(
              _getStatusIcon(request.customData),
              size: 28.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Color _getStatusColor(dynamic customData) {
    switch (customData) {
      case DialogStatus.error:
        return kcError;
      case DialogStatus.warning:
        return kcWarning;
      default:
        return kcSuccess;
    }
  }

  IconData _getStatusIcon(dynamic customData) {
    switch (customData) {
      case DialogStatus.error:
        return Icons.close;
      case DialogStatus.warning:
        return Icons.warning_amber;
      default:
        return Icons.check;
    }
  }
}
