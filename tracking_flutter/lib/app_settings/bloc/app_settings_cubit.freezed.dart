// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettingsState {
  FormzSubmissionStatus get formSubmissionStatus =>
      throw _privateConstructorUsedError;
  AppSettingsFormzState get formState => throw _privateConstructorUsedError;
  AppSettingsLoadingState get loadingState =>
      throw _privateConstructorUsedError;
  AppSettingsDataState get appSettingsData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsStateCopyWith<AppSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsStateCopyWith<$Res> {
  factory $AppSettingsStateCopyWith(
          AppSettingsState value, $Res Function(AppSettingsState) then) =
      _$AppSettingsStateCopyWithImpl<$Res, AppSettingsState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus formSubmissionStatus,
      AppSettingsFormzState formState,
      AppSettingsLoadingState loadingState,
      AppSettingsDataState appSettingsData});

  $AppSettingsLoadingStateCopyWith<$Res> get loadingState;
  $AppSettingsDataStateCopyWith<$Res> get appSettingsData;
}

/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res, $Val extends AppSettingsState>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formSubmissionStatus = null,
    Object? formState = null,
    Object? loadingState = null,
    Object? appSettingsData = null,
  }) {
    return _then(_value.copyWith(
      formSubmissionStatus: null == formSubmissionStatus
          ? _value.formSubmissionStatus
          : formSubmissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      formState: null == formState
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as AppSettingsFormzState,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as AppSettingsLoadingState,
      appSettingsData: null == appSettingsData
          ? _value.appSettingsData
          : appSettingsData // ignore: cast_nullable_to_non_nullable
              as AppSettingsDataState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingsLoadingStateCopyWith<$Res> get loadingState {
    return $AppSettingsLoadingStateCopyWith<$Res>(_value.loadingState, (value) {
      return _then(_value.copyWith(loadingState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingsDataStateCopyWith<$Res> get appSettingsData {
    return $AppSettingsDataStateCopyWith<$Res>(_value.appSettingsData, (value) {
      return _then(_value.copyWith(appSettingsData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsStateImplCopyWith<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  factory _$$AppSettingsStateImplCopyWith(_$AppSettingsStateImpl value,
          $Res Function(_$AppSettingsStateImpl) then) =
      __$$AppSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus formSubmissionStatus,
      AppSettingsFormzState formState,
      AppSettingsLoadingState loadingState,
      AppSettingsDataState appSettingsData});

  @override
  $AppSettingsLoadingStateCopyWith<$Res> get loadingState;
  @override
  $AppSettingsDataStateCopyWith<$Res> get appSettingsData;
}

/// @nodoc
class __$$AppSettingsStateImplCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res, _$AppSettingsStateImpl>
    implements _$$AppSettingsStateImplCopyWith<$Res> {
  __$$AppSettingsStateImplCopyWithImpl(_$AppSettingsStateImpl _value,
      $Res Function(_$AppSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formSubmissionStatus = null,
    Object? formState = null,
    Object? loadingState = null,
    Object? appSettingsData = null,
  }) {
    return _then(_$AppSettingsStateImpl(
      formSubmissionStatus: null == formSubmissionStatus
          ? _value.formSubmissionStatus
          : formSubmissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      formState: null == formState
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as AppSettingsFormzState,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as AppSettingsLoadingState,
      appSettingsData: null == appSettingsData
          ? _value.appSettingsData
          : appSettingsData // ignore: cast_nullable_to_non_nullable
              as AppSettingsDataState,
    ));
  }
}

/// @nodoc

class _$AppSettingsStateImpl implements _AppSettingsState {
  const _$AppSettingsStateImpl(
      {this.formSubmissionStatus = FormzSubmissionStatus.initial,
      this.formState = const AppSettingsFormzState(),
      this.loadingState = const AppSettingsLoadingState.initial(),
      this.appSettingsData = const AppSettingsDataState.initial()});

  @override
  @JsonKey()
  final FormzSubmissionStatus formSubmissionStatus;
  @override
  @JsonKey()
  final AppSettingsFormzState formState;
  @override
  @JsonKey()
  final AppSettingsLoadingState loadingState;
  @override
  @JsonKey()
  final AppSettingsDataState appSettingsData;

  @override
  String toString() {
    return 'AppSettingsState(formSubmissionStatus: $formSubmissionStatus, formState: $formState, loadingState: $loadingState, appSettingsData: $appSettingsData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsStateImpl &&
            (identical(other.formSubmissionStatus, formSubmissionStatus) ||
                other.formSubmissionStatus == formSubmissionStatus) &&
            (identical(other.formState, formState) ||
                other.formState == formState) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.appSettingsData, appSettingsData) ||
                other.appSettingsData == appSettingsData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formSubmissionStatus, formState,
      loadingState, appSettingsData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsStateImplCopyWith<_$AppSettingsStateImpl> get copyWith =>
      __$$AppSettingsStateImplCopyWithImpl<_$AppSettingsStateImpl>(
          this, _$identity);
}

abstract class _AppSettingsState implements AppSettingsState {
  const factory _AppSettingsState(
      {final FormzSubmissionStatus formSubmissionStatus,
      final AppSettingsFormzState formState,
      final AppSettingsLoadingState loadingState,
      final AppSettingsDataState appSettingsData}) = _$AppSettingsStateImpl;

  @override
  FormzSubmissionStatus get formSubmissionStatus;
  @override
  AppSettingsFormzState get formState;
  @override
  AppSettingsLoadingState get loadingState;
  @override
  AppSettingsDataState get appSettingsData;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsStateImplCopyWith<_$AppSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppSettingsDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)
        set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppSettingsInitialState value) initial,
    required TResult Function(_AppSettingsSetState value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppSettingsInitialState value)? initial,
    TResult? Function(_AppSettingsSetState value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppSettingsInitialState value)? initial,
    TResult Function(_AppSettingsSetState value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsDataStateCopyWith<$Res> {
  factory $AppSettingsDataStateCopyWith(AppSettingsDataState value,
          $Res Function(AppSettingsDataState) then) =
      _$AppSettingsDataStateCopyWithImpl<$Res, AppSettingsDataState>;
}

/// @nodoc
class _$AppSettingsDataStateCopyWithImpl<$Res,
        $Val extends AppSettingsDataState>
    implements $AppSettingsDataStateCopyWith<$Res> {
  _$AppSettingsDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppSettingsInitialStateImplCopyWith<$Res> {
  factory _$$AppSettingsInitialStateImplCopyWith(
          _$AppSettingsInitialStateImpl value,
          $Res Function(_$AppSettingsInitialStateImpl) then) =
      __$$AppSettingsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppSettingsInitialStateImplCopyWithImpl<$Res>
    extends _$AppSettingsDataStateCopyWithImpl<$Res,
        _$AppSettingsInitialStateImpl>
    implements _$$AppSettingsInitialStateImplCopyWith<$Res> {
  __$$AppSettingsInitialStateImplCopyWithImpl(
      _$AppSettingsInitialStateImpl _value,
      $Res Function(_$AppSettingsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppSettingsInitialStateImpl implements _AppSettingsInitialState {
  const _$AppSettingsInitialStateImpl();

  @override
  String toString() {
    return 'AppSettingsDataState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)
        set,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppSettingsInitialState value) initial,
    required TResult Function(_AppSettingsSetState value) set,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppSettingsInitialState value)? initial,
    TResult? Function(_AppSettingsSetState value)? set,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppSettingsInitialState value)? initial,
    TResult Function(_AppSettingsSetState value)? set,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AppSettingsInitialState implements AppSettingsDataState {
  const factory _AppSettingsInitialState() = _$AppSettingsInitialStateImpl;
}

/// @nodoc
abstract class _$$AppSettingsSetStateImplCopyWith<$Res> {
  factory _$$AppSettingsSetStateImplCopyWith(_$AppSettingsSetStateImpl value,
          $Res Function(_$AppSettingsSetStateImpl) then) =
      __$$AppSettingsSetStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currency, Duration preSetWorkTime, double preSetRevenue});
}

/// @nodoc
class __$$AppSettingsSetStateImplCopyWithImpl<$Res>
    extends _$AppSettingsDataStateCopyWithImpl<$Res, _$AppSettingsSetStateImpl>
    implements _$$AppSettingsSetStateImplCopyWith<$Res> {
  __$$AppSettingsSetStateImplCopyWithImpl(_$AppSettingsSetStateImpl _value,
      $Res Function(_$AppSettingsSetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? preSetWorkTime = null,
    Object? preSetRevenue = null,
  }) {
    return _then(_$AppSettingsSetStateImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      preSetWorkTime: null == preSetWorkTime
          ? _value.preSetWorkTime
          : preSetWorkTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      preSetRevenue: null == preSetRevenue
          ? _value.preSetRevenue
          : preSetRevenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AppSettingsSetStateImpl implements _AppSettingsSetState {
  const _$AppSettingsSetStateImpl(
      {required this.currency,
      required this.preSetWorkTime,
      required this.preSetRevenue});

  @override
  final String currency;
  @override
  final Duration preSetWorkTime;
  @override
  final double preSetRevenue;

  @override
  String toString() {
    return 'AppSettingsDataState.set(currency: $currency, preSetWorkTime: $preSetWorkTime, preSetRevenue: $preSetRevenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsSetStateImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.preSetWorkTime, preSetWorkTime) ||
                other.preSetWorkTime == preSetWorkTime) &&
            (identical(other.preSetRevenue, preSetRevenue) ||
                other.preSetRevenue == preSetRevenue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currency, preSetWorkTime, preSetRevenue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsSetStateImplCopyWith<_$AppSettingsSetStateImpl> get copyWith =>
      __$$AppSettingsSetStateImplCopyWithImpl<_$AppSettingsSetStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)
        set,
  }) {
    return set(currency, preSetWorkTime, preSetRevenue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
  }) {
    return set?.call(currency, preSetWorkTime, preSetRevenue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String currency, Duration preSetWorkTime, double preSetRevenue)?
        set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(currency, preSetWorkTime, preSetRevenue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppSettingsInitialState value) initial,
    required TResult Function(_AppSettingsSetState value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppSettingsInitialState value)? initial,
    TResult? Function(_AppSettingsSetState value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppSettingsInitialState value)? initial,
    TResult Function(_AppSettingsSetState value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class _AppSettingsSetState implements AppSettingsDataState {
  const factory _AppSettingsSetState(
      {required final String currency,
      required final Duration preSetWorkTime,
      required final double preSetRevenue}) = _$AppSettingsSetStateImpl;

  String get currency;
  Duration get preSetWorkTime;
  double get preSetRevenue;
  @JsonKey(ignore: true)
  _$$AppSettingsSetStateImplCopyWith<_$AppSettingsSetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppSettingsLoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsLoadingStateCopyWith<$Res> {
  factory $AppSettingsLoadingStateCopyWith(AppSettingsLoadingState value,
          $Res Function(AppSettingsLoadingState) then) =
      _$AppSettingsLoadingStateCopyWithImpl<$Res, AppSettingsLoadingState>;
}

/// @nodoc
class _$AppSettingsLoadingStateCopyWithImpl<$Res,
        $Val extends AppSettingsLoadingState>
    implements $AppSettingsLoadingStateCopyWith<$Res> {
  _$AppSettingsLoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppSettingsLoadingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppSettingsLoadingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppSettingsLoadingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AppSettingsLoadingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AppSettingsLoadingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppSettingsLoadingState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AppSettingsLoadingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppSettingsLoadingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AppSettingsLoadingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AppSettingsLoadingStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'AppSettingsLoadingState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AppSettingsLoadingState {
  const factory _Success() = _$SuccessImpl;
}
