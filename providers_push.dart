import 'package:cheap_fit/presentation/cubits/auth/auth_cubit.dart';
import 'package:cheap_fit/presentation/cubits/chart/chart_cubit/chart_cubit.dart';
import 'package:cheap_fit/presentation/cubits/home/home_cubit.dart';
import 'package:cheap_fit/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:cheap_fit/presentation/cubits/notifications/notifications_cubit.dart';
import 'package:cheap_fit/presentation/cubits/page/page_cubit.dart';
import 'package:cheap_fit/presentation/cubits/profile/profile_cubit.dart';
import 'package:cheap_fit/presentation/cubits/questionnaires/questionnaires_cubit.dart';
import 'package:cheap_fit/presentation/cubits/questionnaires/questions_cubit.dart';
import 'package:cheap_fit/presentation/cubits/tournament/tournament_cubit.dart';
import 'package:cheap_fit/utils/providers.dart';

class ProvidersPush {
  static void push() {
    Providers.addBlocProvider<PageCubit>(PageCubit());
    Providers.addBlocProvider<AuthCubit>(AuthCubit());
    Providers.addBlocProvider<NavigationCubit>(NavigationCubit());
    Providers.addBlocProvider<HomeCubit>(HomeCubit());
    Providers.addBlocProvider<NotificationsCubit>(NotificationsCubit());
    Providers.addBlocProvider<ProfileCubit>(ProfileCubit());
    Providers.addBlocProvider<QuestionnairesCubit>(QuestionnairesCubit());
    Providers.addBlocProvider<QuestionsCubit>(QuestionsCubit());
    Providers.addBlocProvider<ChartCubit>(ChartCubit());
    Providers.addBlocProvider<TournamentCubit>(TournamentCubit());
  }
}
