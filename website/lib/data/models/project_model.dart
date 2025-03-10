class ProjectModel {
  final String projectName;
  final String projectDescription;
  final String objective;
  final String resourceURL;
  final String type;
  final String conclusion;

  ProjectModel({
    required this.projectName,
    required this.projectDescription,
    required this.objective,
    required this.resourceURL,
    required this.type,
    required this.conclusion,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectName: json['title'] ?? '',
      projectDescription: json['description'] ?? '',
      objective: json['objective'] ?? '',
      resourceURL: json['resourceURL'] ?? '',
      type: json['type'] ?? '',
      conclusion: json['conclusion'] ?? '',
    );
  }
}
