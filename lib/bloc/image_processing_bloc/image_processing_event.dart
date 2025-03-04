part of 'image_processing_bloc.dart';

@freezed
class ImageProcessingEvent with _$ImageProcessingEvent {
  const factory ImageProcessingEvent.started() = Started;

  const factory ImageProcessingEvent.imageProcessed(ImageSource source) = ImageProcessed;
}
