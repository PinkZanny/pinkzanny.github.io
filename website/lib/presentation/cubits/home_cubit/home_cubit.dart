// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:website/utils/session_manager.dart';
import 'package:website/utils/ultra_logger.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final GoogleSignInPlugin googleSignInPlugin = GoogleSignInPlugin();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email", "profile"]);

  Future<void> initPlugin() async {
    await pluginInit();
    await attachListener();
  }

  Future<void> pluginInit() async {
    await googleSignInPlugin.init();

    try {
      await googleSignIn.signInSilently();
    } catch (e) {
      UltraLogger.logError(e.toString());
      try {
        await googleSignIn.signIn();
      } catch (e) {
        UltraLogger.logError(e.toString());
      }
    }
  }

  Future<void> attachListener() async {
    googleSignInPlugin.userDataEvents?.listen((event) async {
      if (event != null && event.idToken != null) {
        emit(HomeLoading());
        final String idToken = event.idToken!;
        final OAuthCredential credential =
            GoogleAuthProvider.credential(idToken: idToken);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        User? user = userCredential.user;

        if (user != null) {
          String? displayName = user.displayName;
          String? email = user.email;
          SessionManager().user = user;
          UltraLogger.logInfo("User: $displayName, $email, $idToken, $user");
          emit(AuthenticatedUser(user));
        } else {
          emit(HomeError("Authentication failed"));
        }
      }
    });
  }

  void authenticatedUser(User user) {
    emit(AuthenticatedUser(user));
  }

  Future<void> signOut() async {
    emit(HomeLoading());
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    SessionManager().user = null;
    await googleSignIn.disconnect();
    emit(HomeInitial());
  }
}
