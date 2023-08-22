import 'package:go_router/go_router.dart';

import '../../features/reqres/presentation/pages/data_user_reqres_page.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: "/data-user-reqres",
    routes: [
      GoRoute(
        path: "/data-user-reqres",
        name: "data-user-reqres",
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: DataUserReqresPage(),
          );
        },
      ),
    ],
  );
}
