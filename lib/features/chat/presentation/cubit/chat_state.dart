part of 'chat_cubit.dart';

abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class UploadUserDataSucess extends ChatStates {}

class GetUserByNameSucessState extends ChatStates {}

class GetUserByNameFailState extends ChatStates {}

class GetUsersByNameLoadingState extends ChatStates {}

class MessageSentSuccessState extends ChatStates {}

class MessageSentFailState extends ChatStates {}

class ReciverMessageSentSuccessState extends ChatStates {}

class ReciverMessageSentFailState extends ChatStates {}

class GetMessagesSuccessState extends ChatStates {}

class ToggleSearchBarState extends ChatStates {}

class UploadUserDataLoading extends ChatStates {}

class ClearDocsHasTheSameNameState extends ChatStates {}

class StopRecordingState extends ChatStates {}

class ClearDocsHasTheS extends ChatStates {}

class RecordingNowState extends ChatStates {}

class EndRecordingState extends ChatStates {}

class RecorderInitializationLoadingfulState extends ChatStates {}

class RecorderInitializedSuccessfulState extends ChatStates {}

class StartRecordingState extends ChatStates {}

class PickFileSuccessState extends ChatStates {}

class PickFileErrorState extends ChatStates {}

class UploadingImageState extends ChatStates {}

class PickChatImageSuccessState extends ChatStates {}

class PickChatImageErrorState extends ChatStates {}

class CancleChatImageState extends ChatStates {}

class UploadChatVoiceLoadingState extends ChatStates {}

class UploadChatVoiceSuccessState extends ChatStates {}

class ToggleTextFieldVisiblility extends ChatStates {}
