// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScannerEvent {
  List<GS1Barcode> get barcode => throw _privateConstructorUsedError;
  List<String> get qrcode => throw _privateConstructorUsedError;
  bool get isReferral => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerScanEvent value) handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerScanEvent value)? handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScannerEventCopyWith<ScannerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannerEventCopyWith<$Res> {
  factory $ScannerEventCopyWith(
          ScannerEvent value, $Res Function(ScannerEvent) then) =
      _$ScannerEventCopyWithImpl<$Res, ScannerEvent>;
  @useResult
  $Res call({List<GS1Barcode> barcode, List<String> qrcode, bool isReferral});
}

/// @nodoc
class _$ScannerEventCopyWithImpl<$Res, $Val extends ScannerEvent>
    implements $ScannerEventCopyWith<$Res> {
  _$ScannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? qrcode = null,
    Object? isReferral = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReferral: null == isReferral
          ? _value.isReferral
          : isReferral // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScannerScanEventImplCopyWith<$Res>
    implements $ScannerEventCopyWith<$Res> {
  factory _$$ScannerScanEventImplCopyWith(_$ScannerScanEventImpl value,
          $Res Function(_$ScannerScanEventImpl) then) =
      __$$ScannerScanEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GS1Barcode> barcode, List<String> qrcode, bool isReferral});
}

/// @nodoc
class __$$ScannerScanEventImplCopyWithImpl<$Res>
    extends _$ScannerEventCopyWithImpl<$Res, _$ScannerScanEventImpl>
    implements _$$ScannerScanEventImplCopyWith<$Res> {
  __$$ScannerScanEventImplCopyWithImpl(_$ScannerScanEventImpl _value,
      $Res Function(_$ScannerScanEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? qrcode = null,
    Object? isReferral = null,
  }) {
    return _then(_$ScannerScanEventImpl(
      null == barcode
          ? _value._barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      null == qrcode
          ? _value._qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReferral: null == isReferral
          ? _value.isReferral
          : isReferral // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScannerScanEventImpl implements ScannerScanEvent {
  const _$ScannerScanEventImpl(
      final List<GS1Barcode> barcode, final List<String> qrcode,
      {this.isReferral = false})
      : _barcode = barcode,
        _qrcode = qrcode;

  final List<GS1Barcode> _barcode;
  @override
  List<GS1Barcode> get barcode {
    if (_barcode is EqualUnmodifiableListView) return _barcode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcode);
  }

  final List<String> _qrcode;
  @override
  List<String> get qrcode {
    if (_qrcode is EqualUnmodifiableListView) return _qrcode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrcode);
  }

  @override
  @JsonKey()
  final bool isReferral;

  @override
  String toString() {
    return 'ScannerEvent.handleScanner(barcode: $barcode, qrcode: $qrcode, isReferral: $isReferral)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerScanEventImpl &&
            const DeepCollectionEquality().equals(other._barcode, _barcode) &&
            const DeepCollectionEquality().equals(other._qrcode, _qrcode) &&
            (identical(other.isReferral, isReferral) ||
                other.isReferral == isReferral));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barcode),
      const DeepCollectionEquality().hash(_qrcode),
      isReferral);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerScanEventImplCopyWith<_$ScannerScanEventImpl> get copyWith =>
      __$$ScannerScanEventImplCopyWithImpl<_$ScannerScanEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)
        handleScanner,
  }) {
    return handleScanner(barcode, qrcode, isReferral);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
  }) {
    return handleScanner?.call(barcode, qrcode, isReferral);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(barcode, qrcode, isReferral);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerScanEvent value) handleScanner,
  }) {
    return handleScanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerScanEvent value)? handleScanner,
  }) {
    return handleScanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(this);
    }
    return orElse();
  }
}

abstract class ScannerScanEvent implements ScannerEvent {
  const factory ScannerScanEvent(
      final List<GS1Barcode> barcode, final List<String> qrcode,
      {final bool isReferral}) = _$ScannerScanEventImpl;

  @override
  List<GS1Barcode> get barcode;
  @override
  List<String> get qrcode;
  @override
  bool get isReferral;
  @override
  @JsonKey(ignore: true)
  _$$ScannerScanEventImplCopyWith<_$ScannerScanEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScannerState {
  List<GS1Barcode> get barcodes => throw _privateConstructorUsedError;
  List<String> get qrcodes => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get duplicate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScannerStateCopyWith<ScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannerStateCopyWith<$Res> {
  factory $ScannerStateCopyWith(
          ScannerState value, $Res Function(ScannerState) then) =
      _$ScannerStateCopyWithImpl<$Res, ScannerState>;
  @useResult
  $Res call(
      {List<GS1Barcode> barcodes,
      List<String> qrcodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class _$ScannerStateCopyWithImpl<$Res, $Val extends ScannerState>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcodes = null,
    Object? qrcodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_value.copyWith(
      barcodes: null == barcodes
          ? _value.barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcodes: null == qrcodes
          ? _value.qrcodes
          : qrcodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScannerStateImplCopyWith<$Res>
    implements $ScannerStateCopyWith<$Res> {
  factory _$$ScannerStateImplCopyWith(
          _$ScannerStateImpl value, $Res Function(_$ScannerStateImpl) then) =
      __$$ScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GS1Barcode> barcodes,
      List<String> qrcodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class __$$ScannerStateImplCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$ScannerStateImpl>
    implements _$$ScannerStateImplCopyWith<$Res> {
  __$$ScannerStateImplCopyWithImpl(
      _$ScannerStateImpl _value, $Res Function(_$ScannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcodes = null,
    Object? qrcodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_$ScannerStateImpl(
      barcodes: null == barcodes
          ? _value._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcodes: null == qrcodes
          ? _value._qrcodes
          : qrcodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScannerStateImpl implements _ScannerState {
  const _$ScannerStateImpl(
      {final List<GS1Barcode> barcodes = const [],
      final List<String> qrcodes = const [],
      this.loading = false,
      this.duplicate = false})
      : _barcodes = barcodes,
        _qrcodes = qrcodes;

  final List<GS1Barcode> _barcodes;
  @override
  @JsonKey()
  List<GS1Barcode> get barcodes {
    if (_barcodes is EqualUnmodifiableListView) return _barcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  final List<String> _qrcodes;
  @override
  @JsonKey()
  List<String> get qrcodes {
    if (_qrcodes is EqualUnmodifiableListView) return _qrcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrcodes);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool duplicate;

  @override
  String toString() {
    return 'ScannerState(barcodes: $barcodes, qrcodes: $qrcodes, loading: $loading, duplicate: $duplicate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerStateImpl &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes) &&
            const DeepCollectionEquality().equals(other._qrcodes, _qrcodes) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barcodes),
      const DeepCollectionEquality().hash(_qrcodes),
      loading,
      duplicate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerStateImplCopyWith<_$ScannerStateImpl> get copyWith =>
      __$$ScannerStateImplCopyWithImpl<_$ScannerStateImpl>(this, _$identity);
}

abstract class _ScannerState implements ScannerState {
  const factory _ScannerState(
      {final List<GS1Barcode> barcodes,
      final List<String> qrcodes,
      final bool loading,
      final bool duplicate}) = _$ScannerStateImpl;

  @override
  List<GS1Barcode> get barcodes;
  @override
  List<String> get qrcodes;
  @override
  bool get loading;
  @override
  bool get duplicate;
  @override
  @JsonKey(ignore: true)
  _$$ScannerStateImplCopyWith<_$ScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
