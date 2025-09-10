import 'package:fr_core/fr_core.dart';

class FrAuthPage extends StatelessWidget {
  Widget? titleWidget;
  Widget? logoWidget;
  Color? cardColor;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Widget child;

  FrAuthPage({
    super.key,
    this.titleWidget,
    this.logoWidget,
    this.margin,
    this.padding,
    this.cardColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: margin??EdgeInsets.all(0),
                            child: Column(
                              children: [
                                if(logoWidget != null)
                                  logoWidget!,
                                Card(
                                  color: cardColor,
                                  child: Padding(
                                    padding: padding??EdgeInsets.all(0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      if(titleWidget != null)
                                        titleWidget!,
                                      child,
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}