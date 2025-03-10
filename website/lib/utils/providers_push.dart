import 'package:website/presentation/cubits/custom_textfield/custom_textfield_cubit.dart';
import 'package:website/utils/providers.dart';

class ProvidersPush {
  static void push() {
    // Providers.addBlocProvider<PageCubit>(PageCubit());
    Providers.addBlocProvider<CustomTextfieldCubit>(CustomTextfieldCubit());
  }
}
