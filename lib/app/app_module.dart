import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_controller.dart';
import 'package:flutter_gofast/app/core/consts/routers_const.dart';
import 'package:flutter_gofast/app/interfaces/auth_repository_interface.dart';
import 'package:flutter_gofast/app/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/app/repositories/auth_repository.dart';
import 'package:flutter_gofast/app/repositories/shared_repository.dart';
import 'package:flutter_gofast/app/views/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'controllers/auth/auth_controller.dart';
import 'modules/home_module.dart';
import 'modules/intro_module.dart';
import 'modules/login_module.dart';
import 'modules/register/register_module.dart';



class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        // Repositories
        Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        // Controllers
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => AuthController(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(
          RoutersConst.splash,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          RoutersConst.intro,
          module: IntroModule(),
        ),
        Router(
          RoutersConst.login,
          module: LoginModule(),
        ),
        Router(
          RoutersConst.register,
          module: RegisterModule(),
        ),   
        Router(
          RoutersConst.home,
          module: HomeModule(),
        ),
      ];
}
