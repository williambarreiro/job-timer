import 'package:job_timer/app/view_models/project_task_model.dart';

import '../../entities/project_status.dart';
import '../../view_models/project_model.dart';

abstract class ProjectsService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task);
  Future<void> finish(int projectId);
}
