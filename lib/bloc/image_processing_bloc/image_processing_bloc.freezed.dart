// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_processing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageProcessingEvent {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ImageProcessingEvent);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ImageProcessingEvent()';
  }


}

/// @nodoc
class $ImageProcessingEventCopyWith<$Res> {
  $ImageProcessingEventCopyWith(ImageProcessingEvent _,
      $Res Function(ImageProcessingEvent) __);
}


/// Adds pattern-matching-related methods to [ImageProcessingEvent].
extension ImageProcessingEventPatterns on ImageProcessingEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  Started

  value

  )

  ?

  started

  ,

  TResult

  Function

  (

  ImageProcessed

  value

  )

  ?

  imageProcessed

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case ImageProcessed() when imageProcessed != null:
return imageProcessed(_that);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( Started value) started, required TResult Function( ImageProcessed value) imageProcessed,}) {
  final _that = this;
  switch (_that) {
    case Started():
      return started(_that);
    case ImageProcessed():
      return imageProcessed(_that);
    case _:
      throw StateError('Unexpected subclass');
  }
}

/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( Started value)? started, TResult? Function( ImageProcessed value)? imageProcessed,}) {
  final _that = this;
  switch (_that) {
    case Started() when started != null:
      return started(_that);
    case ImageProcessed() when imageProcessed != null:
      return imageProcessed(_that);
    case _:
      return null;
  }
}

/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
)
?
started
,
TResult
Function
(
ImageSource
source
)
?
imageProcessed
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case ImageProcessed() when imageProcessed != null:
return imageProcessed(_that.source);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function() started,required TResult Function( ImageSource source) imageProcessed,}) {final _that = this;
switch (_that) {
case Started():
return started();case ImageProcessed():
return imageProcessed(_that.source);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()? started,TResult? Function( ImageSource source)? imageProcessed,}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case ImageProcessed() when imageProcessed != null:
return imageProcessed(_that.source);case _:
return null;

}
}

}

/// @nodoc


class Started implements ImageProcessingEvent {
const Started();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ImageProcessingEvent.started()';
}


}


/// @nodoc


class ImageProcessed implements ImageProcessingEvent {
const ImageProcessed(this.source);


final ImageSource source;

/// Create a copy of ImageProcessingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageProcessedCopyWith<ImageProcessed> get copyWith => _$ImageProcessedCopyWithImpl<ImageProcessed>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageProcessed&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,source);

@override
String toString() {
return 'ImageProcessingEvent.imageProcessed(source: $source)';
}


}

/// @nodoc
abstract mixin class $ImageProcessedCopyWith<$Res> implements $ImageProcessingEventCopyWith<$Res> {
factory $ImageProcessedCopyWith(ImageProcessed value, $Res Function(ImageProcessed) _then) = _$ImageProcessedCopyWithImpl;
@useResult
$Res call({
ImageSource source
});


}
/// @nodoc
class _$ImageProcessedCopyWithImpl<$Res>
implements $ImageProcessedCopyWith<$Res> {
_$ImageProcessedCopyWithImpl(this._self, this._then);

final ImageProcessed _self;
final $Res Function(ImageProcessed) _then;

/// Create a copy of ImageProcessingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
return _then(ImageProcessed(
null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImageSource,
));
}


}

/// @nodoc
mixin _$ImageProcessingState {


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageProcessingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ImageProcessingState()';
}


}

/// @nodoc
class $ImageProcessingStateCopyWith<$Res> {
$ImageProcessingStateCopyWith(ImageProcessingState _, $Res Function(ImageProcessingState) __);
}


/// Adds pattern-matching-related methods to [ImageProcessingState].
extension ImageProcessingStatePatterns on ImageProcessingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)? initial,TResult Function( InProgress value)? inProgress,TResult Function( Processing value)? processing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case InProgress() when inProgress != null:
return inProgress(_that);case Processing() when processing != null:
return processing(_that);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value) initial,required TResult Function( InProgress value) inProgress,required TResult Function( Processing value) processing,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case InProgress():
return inProgress(_that);case Processing():
return processing(_that);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)? initial,TResult? Function( InProgress value)? inProgress,TResult? Function( Processing value)? processing,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case InProgress() when inProgress != null:
return inProgress(_that);case Processing() when processing != null:
return processing(_that);case _:
return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()? initial,TResult Function()? inProgress,TResult Function( File? image, String? text)? processing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case InProgress() when inProgress != null:
return inProgress();case Processing() when processing != null:
return processing(_that.image,_that.text);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function() initial,required TResult Function() inProgress,required TResult Function( File? image, String? text) processing,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case InProgress():
return inProgress();case Processing():
return processing(_that.image,_that.text);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()? initial,TResult? Function()? inProgress,TResult? Function( File? image, String? text)? processing,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case InProgress() when inProgress != null:
return inProgress();case Processing() when processing != null:
return processing(_that.image,_that.text);case _:
return null;

}
}

}

/// @nodoc


class Initial implements ImageProcessingState {
const Initial();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ImageProcessingState.initial()';
}


}


/// @nodoc


class InProgress implements ImageProcessingState {
const InProgress();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'ImageProcessingState.inProgress()';
}


}


/// @nodoc


class Processing implements ImageProcessingState {
const Processing({this.image, this.text});


final File? image;
final String? text;

/// Create a copy of ImageProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessingCopyWith<Processing> get copyWith => _$ProcessingCopyWithImpl<Processing>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing&&(identical(other.image, image) || other.image == image)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,image,text);

@override
String toString() {
return 'ImageProcessingState.processing(image: $image, text: $text)';
}


}

/// @nodoc
abstract mixin class $ProcessingCopyWith<$Res> implements $ImageProcessingStateCopyWith<$Res> {
factory $ProcessingCopyWith(Processing value, $Res Function(Processing) _then) = _$ProcessingCopyWithImpl;
@useResult
$Res call({
File? image, String? text
});


}
/// @nodoc
class _$ProcessingCopyWithImpl<$Res>
implements $ProcessingCopyWith<$Res> {
_$ProcessingCopyWithImpl(this._self, this._then);

final Processing _self;
final $Res Function(Processing) _then;

/// Create a copy of ImageProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? text = freezed,}) {
return _then(Processing(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
));
}


}

// dart format on
