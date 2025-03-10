part of 'project_cubit.dart';

@immutable
sealed class ProjectState {}

final class ProjectsLoading extends ProjectState {}

final class ProjectList extends ProjectState {
  final List<ProjectModel> projects;

  ProjectList(this.projects);
}

final class ProjectDetails extends ProjectState {
  final ProjectModel project;

  ProjectDetails(this.project);
}
