import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:website/data/models/project_model.dart';
import 'package:website/utils/ultra_logger.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectsLoading());

  Future<void> getProjects() async {
    emit(ProjectsLoading());
    try {
      final jsonString =
          await rootBundle.loadString('lib/data/data_sources/projects.json');
      final Map<String, dynamic> mappedJSON = jsonDecode(jsonString);
      UltraLogger.logInfo('Projects: $mappedJSON');
      final List<ProjectModel> projects = [];
      for (final item in mappedJSON['projects']) {
        projects.add(ProjectModel.fromJson(item));
      }
      emit(ProjectList(projects));
    } catch (e) {
      UltraLogger.logError('Error loading projects: $e');
    }
  }

  void getProjectDetails(ProjectModel project) {
    emit(ProjectDetails(project));
  }
}
