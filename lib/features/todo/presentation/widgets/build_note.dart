import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BuildNote extends StatelessWidget {
  const BuildNote({super.key, required this.itemBuilder ,this.itemCount});

  final Widget Function(BuildContext, int) itemBuilder;
 final int? itemCount;
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8),
      itemCount:itemCount ,
      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: itemBuilder,
    );
  }
}
