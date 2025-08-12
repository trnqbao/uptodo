import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:uptodo/global_widgets/my_button.dart';
import 'package:uptodo/global_widgets/my_markdown.dart';
import 'package:uptodo/modules/focus/bar_graph/bar_graph.dart';
import 'package:uptodo/modules/focus/controllers/focus_controller.dart';
import 'package:uptodo/global_widgets/my_elevated_button.dart';

import '../widgets/custom_tile.dart';

class FocusView extends GetView<FocusController> {
  const FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Obx(() => CircularProgressIndicator(
                    value: controller.progress.value,
                    strokeWidth: 10,
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),),
                ),
                Obx(() => Text(controller.time.value, style: TextStyle(fontSize: 45),)),
              ],
            ),

            const SizedBox(height: 30,),

            Text("While your focus mode is on, all of your notifications will be off"),

            const SizedBox(height: 30,),

            Obx(() {
                return MyElevatedButton(
                    title: "${controller.statusButton.value} Focusing",
                    width: 200,
                    onPressed: () {controller.onButtonClick();});
            }),

            const SizedBox(height: 30,),

            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Overview", style: TextStyle(fontSize: 20),),
                      MyMarkdown(title: "This week",
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        textColor: Theme.of(context).colorScheme.onSurface,
                        iconColor: Theme.of(context).colorScheme.onSurface,)
                    ],
                  ),

                  const SizedBox(height: 30,),

                  SizedBox(
                    height: 250,
                    child: MyBarGraph(
                      weeklySummary: controller.weeklySummary,
                    ),),
                ],
              ),
            ),

            const SizedBox(height: 50,),

            SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Applications", style: TextStyle(fontSize: 20),)),

                  const SizedBox(height: 30,),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CustomTile(
                        title: 'Instagram',
                        description: 'You spent 1h on Instagram today',
                        iconPath: 'assets/icons/instagram.svg',
                        onTap: () {},
                      );
                    }
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}