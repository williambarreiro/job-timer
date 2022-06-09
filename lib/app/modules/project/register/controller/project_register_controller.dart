import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../../entities/project_status.dart';
import '../../../../services/projects/projects_service.dart';
import '../../../../view_models/project_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  final ProjectsService _projectService;

  ProjectRegisterController({required ProjectsService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    emit(ProjectRegisterStatus.loading);
    try {
      final project = ProjectModel(
          name: name,
          estimate: estimate,
          status: ProjectStatus.emAndamento,
          task: []);
      await _projectService.register(project);
      emit(ProjectRegisterStatus.success);
    } catch (e, s) {
      log('Erro ao salvar projeto', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}
