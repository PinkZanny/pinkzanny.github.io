import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:website/presentation/cubits/project_cubit/project_cubit.dart';
import 'package:website/presentation/widgets/project_entry.dart';
import 'package:website/utils/constants.dart';
import 'package:website/utils/responsive_background.dart';
import 'package:website/utils/screen_size.dart';
import 'package:website/utils/session_manager.dart';
import 'package:website/utils/texttheme_manager.dart';
import 'package:website/utils/toast.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBackground(
      page: Padding(
        padding: EdgeInsets.all(ScreenSize.isWebMobile
            ? Constants.smallPaddingMobile
            : Constants.smallPadding),
        child: ScreenSize.isWebMobile ? const MobileBody() : const WebBody(),
      ),
    );
  }
}

class WebBody extends StatelessWidget {
  const WebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ScreenSize.width != null ? ScreenSize.width! * 0.5 : 500,
          maxHeight: ScreenSize.height != null ? ScreenSize.height! * 0.6 : 500,
        ),
        child: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            if (state is ProjectsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProjectList) {
              return ListView(
                padding: const EdgeInsets.all(Constants.smallPadding),
                children: [
                  Text(
                    'Project List',
                    style: TTheme.displayText,
                  ),
                  const SizedBox(height: Constants.smallPadding),
                  Text(
                    'My projects extend on my knowledge and interest domain.\nThis concerns in coding financial, statistical, academic, quantitative, and creative projects.\nProjects tagged "Ongoing" are currently in development, so they aren\'t available for download yet.\nProjects tagged "Work Product" are projects developed for work purposes, due to copyright and privacy reasons, they are not available for download.',
                    style: TTheme.subText,
                  ),
                  const SizedBox(height: Constants.largePadding),
                  for (final project in state.projects)
                    InkWell(
                      mouseCursor: SystemMouseCursors.none,
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        context.read<ProjectCubit>().getProjectDetails(
                              project,
                            );
                      },
                      child: ProjectEntryWidget(
                        projectName: project.projectName,
                        projectDescription: project.projectDescription,
                      ),
                    ),
                ],
              );
            }
            if (state is ProjectDetails) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          mouseCursor: SystemMouseCursors.none,
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            context.read<ProjectCubit>().getProjects();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: Constants.buttonSize,
                          ),
                        ),
                        const SizedBox(width: Constants.padding),
                        Expanded(
                          child: Text(
                            state.project.projectName,
                            style: TTheme.displayText,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Constants.smallPadding),
                    Text(
                      state.project.projectDescription,
                      style: TTheme.subText,
                    ),
                    const SizedBox(height: Constants.smallPadding),
                    Text(
                      'Project Objectives',
                      style: TTheme.smallDisplayText,
                    ),
                    const SizedBox(height: Constants.smallPadding),
                    Text(
                      state.project.objective,
                      style: TTheme.subText,
                    ),
                    const SizedBox(height: Constants.smallPadding),
                    if (state.project.conclusion.isNotEmpty)
                      Text(
                        'Project Conclusions',
                        style: TTheme.smallDisplayText,
                      ),
                    if (state.project.conclusion.isNotEmpty)
                      const SizedBox(height: Constants.smallPadding),
                    if (state.project.conclusion.isNotEmpty)
                      Text(
                        state.project.conclusion,
                        style: TTheme.subText,
                      ),
                    const SizedBox(height: Constants.largePadding),
                    Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        mouseCursor: SystemMouseCursors.none,
                        onTap: () {
                          if (SessionManager().user == null &&
                              state.project.resourceURL.isNotEmpty) {
                            CustomToast.errorToast(
                                "You need to be signed in to download this resource.");
                            return;
                          } else if (state.project.resourceURL.isNotEmpty) {
                            launchUrlString(state.project.resourceURL);
                          } else {
                            CustomToast.errorToast(
                                "This project isn't available for download.");
                          }
                        },
                        child: Container(
                          height: 44,
                          width: 160,
                          decoration: BoxDecoration(
                              color: state.project.type == 'Download'
                                  ? Constants.accentColor
                                  : state.project.type == 'Ongoing'
                                      ? Constants.successColor
                                      : Constants.failureColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Constants.smallPadding),
                            child: Center(
                              child: Text(
                                state.project.resourceURL.isNotEmpty
                                    ? "Download"
                                    : state.project.type,
                                style: TTheme.directoryTextSelected,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Error loading projects'),
              );
            }
          },
        ),
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ScreenSize.width!,
          maxHeight: ScreenSize.height != null ? ScreenSize.height! * 0.5 : 500,
        ),
        child: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            if (state is ProjectsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is ProjectList) {
              return Material(
                color: Colors.transparent,
                borderOnForeground: false,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Project List',
                        style: TTheme.displayText,
                      ),
                    ),
                    const SizedBox(height: Constants.smallPadding),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.smallPadding),
                        children: [
                          Text(
                            'My projects extend on my knowledge and interest domain.\nThis concerns in coding financial, statistical, academic, quantitative, and creative projects.\nProjects tagged "Ongoing" are currently in development, so they aren\'t available for download yet.\nProjects tagged "Work Product" are projects developed for work purposes, due to copyright and privacy reasons, they are not available for download.',
                            style: TTheme.subText,
                          ),
                          const SizedBox(height: Constants.largePadding),
                          for (final project in state.projects)
                            InkWell(
                              mouseCursor: SystemMouseCursors.none,
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                context
                                    .read<ProjectCubit>()
                                    .getProjectDetails(project);
                              },
                              child: ProjectEntryWidget(
                                projectName: project.projectName,
                                projectDescription: project.projectDescription,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is ProjectDetails) {
              return Material(
                color: Colors.transparent,
                borderOnForeground: false,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              mouseCursor: SystemMouseCursors.none,
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                context.read<ProjectCubit>().getProjects();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: Constants.buttonSizeMobile,
                              ),
                            ),
                            const SizedBox(width: Constants.padding),
                            Expanded(
                              child: Text(
                                state.project.projectName,
                                style: TTheme.smallDisplayText,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.smallPadding),
                        Text(
                          state.project.projectDescription,
                          style: TTheme.subText,
                        ),
                        const SizedBox(height: Constants.smallPadding),
                        Text(
                          'Project Objectives',
                          style: TTheme.smallDisplayText,
                        ),
                        const SizedBox(height: Constants.smallPadding),
                        Text(
                          state.project.objective,
                          style: TTheme.subText,
                        ),
                        const SizedBox(height: Constants.smallPadding),
                        if (state.project.conclusion.isNotEmpty)
                          Text(
                            'Project Conclusions',
                            style: TTheme.smallDisplayText,
                          ),
                        if (state.project.conclusion.isNotEmpty)
                          const SizedBox(height: Constants.smallPadding),
                        if (state.project.conclusion.isNotEmpty)
                          Text(
                            state.project.conclusion,
                            style: TTheme.subText,
                          ),
                        const SizedBox(height: Constants.largePadding),
                        Center(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            mouseCursor: SystemMouseCursors.none,
                            onTap: () {
                              if (SessionManager().user == null &&
                                  state.project.resourceURL.isNotEmpty) {
                                CustomToast.errorToast(
                                    "You need to be signed in to download this resource.");
                                return;
                              } else if (state.project.resourceURL.isNotEmpty) {
                                launchUrlString(state.project.resourceURL);
                              } else {
                                CustomToast.errorToast(
                                    "This project isn't available for download.");
                              }
                            },
                            child: Container(
                              height: 44,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: state.project.type == 'Download'
                                      ? Constants.accentColor
                                      : state.project.type == 'Ongoing'
                                          ? Constants.successColor
                                          : Constants.failureColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Constants.smallPadding),
                                child: Center(
                                  child: Text(
                                    state.project.resourceURL.isNotEmpty
                                        ? "Download"
                                        : state.project.type,
                                    style: TTheme.directoryTextSelected,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error loading projects'),
              );
            }
          },
        ),
      ),
    );
  }
}
