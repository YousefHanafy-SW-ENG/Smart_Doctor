part of 'show_result_cubit.dart';

abstract class ShowResultState {}

class ShowResultInitial extends ShowResultState {}

class ToggleImageVisibilityState extends ShowResultState {}

class ToggleIconVisibilityState extends ShowResultState {}

class ToggleOutPatientVisibilityState extends ShowResultState {}

class ChangeValueState extends ShowResultState {}

class ChangeTestNameValueState extends ShowResultState {}

class ChangeTestTypeValueState extends ShowResultState {}

class CloseAllImagesState extends ShowResultState {}

class OpenPrescriptionImagesState extends ShowResultState {}

class ClosePrescriptionImagesState extends ShowResultState {}

class OpenReportImagesState extends ShowResultState {}

class CloseReportImagesState extends ShowResultState {}

class OpenLabImagesState extends ShowResultState {}

class CloseLabImagesState extends ShowResultState {}

class DataSharedSuccessfullyState extends ShowResultState {}

class DataSharedErrorState extends ShowResultState {}
