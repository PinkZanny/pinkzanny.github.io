part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoaded extends DashboardState {
  @override
  List<Object?> get props => [];
}
