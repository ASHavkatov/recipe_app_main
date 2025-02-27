import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/core/routess.dart';
import 'package:new_recipe_app/features/singin/presentation/pages/complate_profile.dart';
import '../features/categories/data/repositories/categories_repository.dart';
import '../features/categories/presentation/manager/categories_view_model.dart';
import '../features/categories/presentation/pages/categories_page.dart';
import '../features/onboarding/data/repositories/onboarding_repository.dart';
import '../features/onboarding/presentation/manager/onboarding_view_model.dart';
import '../features/onboarding/presentation/pages/onboarding_end.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/profile/data/repositories/profile_repository.dart';
import '../features/profile/data/repositories/recipes_repository.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/profile/presentation/pages/profile_view_model.dart';
import '../features/singin/data/repositories/auth_repository.dart';
import '../features/singin/presentation/manager/login_view_model.dart';
import '../features/singin/presentation/pages/login_view.dart';
import '../features/singin/presentation/pages/singup_view.dart';
import 'client.dart';

class GoRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.singup,
        builder: (context, state) => SingupView(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => ProfilePage(
          vm: ProfileViewModel(
            recipeRepo: RecipeRepository(client: ApiClient()),
            profileRepo: ProfileRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => OnboardingPage(
          ovm: OnBoardingViewModel(
            repo: OnBoardingRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.onboarding_end,
        builder: (context, state) => OnboardingEnd(
          pvm: ProfileViewModel(
            recipeRepo: RecipeRepository(client: ApiClient()),
            profileRepo: ProfileRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.categories,
        builder: (context, state) => CategoriesPage(
          cvm: CategoriesViewModel(
            repo: CategoriesRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginView(
          vm: LoginViewModel(repo: AuthRepository(client: ApiClient())),
        ),
      ),
      GoRoute(
        path: Routes.complateProfile,
        builder:(context, state) => ComplateProfile()
      )
    ],
  );
}
