import 'package:fr_core/fr_core.dart';
import '../logic/rapid_global_state_logic.dart';

class RapidBusyWidget extends StatelessWidget {
  const RapidBusyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class SystemBusyWidgetManager extends RapidBasicView<RapidGlobalStateLogic> {
  final Widget child;

  const SystemBusyWidgetManager({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isSystemBusy.value
          ? Stack(
              children: <Widget>[
                controller.isSystemBusyDismissible.value
                    ? const SizedBox()
                    : ModalBarrier(
                        dismissible: false,
                        color: Colors.grey.withOpacity(0),
                      ),
                child,
              ],
            )
          : const SizedBox();
    });
  }
}