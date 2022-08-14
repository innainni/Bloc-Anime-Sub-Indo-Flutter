part of 'config_app_cubit.dart';

@immutable
abstract class ConfigAppState {}

class ConfigAppInitial extends ConfigAppState {}

class ConfigAppLoading extends ConfigAppState {}

class ConfigAppSuccess extends ConfigAppState {
  final ConfigApp configApp;

  ConfigAppSuccess({required this.configApp});
}

class ConfigAppError extends ConfigAppState {
  final String message;

  ConfigAppError({required this.message});
}
