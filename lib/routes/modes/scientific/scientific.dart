import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insta_calculator/routes/modes/common/fields.dart';

class ScientificContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FieldContainer(),
            ),
          ),
          Flexible(
            flex: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Neumorphic(),
            ),
          ),
        ],
      ),
    );
  }
}
