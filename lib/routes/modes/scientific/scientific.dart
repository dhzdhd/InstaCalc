import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/models/theme.dart';
import 'package:insta_calculator/routes/modes/common/button_list.dart';
import 'package:insta_calculator/routes/modes/common/buttons.dart';
import 'package:insta_calculator/routes/modes/common/fields.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ScientificContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FieldContainer(),
            ),
          ),
          Expanded(
            flex: 31,
            child: SlidingUpPanel(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              renderPanelSheet: false,
              minHeight: 30,
              collapsed: Padding(
                padding: EdgeInsets.all(5),
                child: Neumorphic(
                  style: NeumorphicStyle(color: ThemeModel().equalColor),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              panel: Consumer<ThemeModel>(builder: (context, model, child) {
                return Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                        child: Neumorphic(
                          style:
                              NeumorphicStyle(color: ThemeModel().equalColor),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 19,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          color: model.baseColor,
                          child: CalcButtonWidget(
                            aspectRatio:
                                MediaQuery.of(context).size.aspectRatio *
                                    15 /
                                    7,
                            buttonList: ButtonList.scientificButtonList,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CalcButtonWidget(
                    aspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 15 / 7,
                    buttonList: ButtonList.simpleButtonList,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
