import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/modules/login/login_module.dart';
import 'package:job_timer/app/modules/splash/splash_page.dart';
import 'package:job_timer/app/repositories/projects/project_repository_impl.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';
import 'package:job_timer/app/services/projects/projects_service_impl.dart';

import 'core/database/database_impl.dart';
import 'modules/home/home_module.dart';
import 'modules/project/project_module.dart';
import 'repositories/projects/project_repository.dart';
import 'services/auth/auth_service.dart';
import 'services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl(database: i())),
        Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(database: i())),
        Bind.lazySingleton<ProjectsService>(
            (i) => ProjectsServiceImpl(projectRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/project/', module: ProjectModule()),
      ];
}
