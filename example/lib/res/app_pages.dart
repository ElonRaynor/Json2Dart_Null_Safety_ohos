import 'package:gesound/page/page_api_demo.dart';
import 'package:gesound/page/page_splash.dart';
import 'package:get/get.dart';

import '../page/controller/category_controller.dart';
import '../page/page_category.dart';
import '../page/page_playlist.dart';

class AppPages {
  static const INITIAL = PageSplash.routeName;
  static final List<GetPage> routes = [
    _page(
      name: PagePlaylist.routeName,
      page: () => const PagePlaylist(),
    ),
    _page(
      name: PageCategory.routeName,
      page: () => const PageCategory(),
      binding: CategoryBinding(),
    ),
    _page(
      name: PageSplash.routeName,
      page: () => const PageSplash(),
    ),
    _page(
      name: PageApiDemo.routeName,
      page: () => const PageApiDemo(),
    ),
  ];

  static final unknownRoute = _page(
    name: PagePlaylist.routeName,
    page: () => const PagePlaylist(),
  );

  static GetPage _page({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    Transition? transition,
    CustomTransition? customTransition,
  }) {
    return GetPage(
      name: name,
      binding: binding,
      customTransition: customTransition,
      transition: transition ?? Transition.rightToLeft,
      page: page,
    );
  }
}
