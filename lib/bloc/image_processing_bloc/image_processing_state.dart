part of 'image_processing_bloc.dart';

@freezed
class ImageProcessingState with _$ImageProcessingState {
  const factory ImageProcessingState.initial() = Initial;

  const factory ImageProcessingState.inProgress() = InProgress;

  const factory ImageProcessingState.processing({File? image, String? text}) = Processing;
}
