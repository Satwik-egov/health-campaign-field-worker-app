// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'audit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuditDetailsModel _$AuditDetailsModelFromJson(Map<String, dynamic> json) {
  return _AuditDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AuditDetailsModel {
  String get createdBy => throw _privateConstructorUsedError;
  int get createdTime => throw _privateConstructorUsedError;
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  String? get lastModifiedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditDetailsModelCopyWith<AuditDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditDetailsModelCopyWith<$Res> {
  factory $AuditDetailsModelCopyWith(
          AuditDetailsModel value, $Res Function(AuditDetailsModel) then) =
      _$AuditDetailsModelCopyWithImpl<$Res, AuditDetailsModel>;
  @useResult
  $Res call(
      {String createdBy,
      int createdTime,
      String? lastModifiedBy,
      String? lastModifiedTime});
}

/// @nodoc
class _$AuditDetailsModelCopyWithImpl<$Res, $Val extends AuditDetailsModel>
    implements $AuditDetailsModelCopyWith<$Res> {
  _$AuditDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? createdTime = null,
    Object? lastModifiedBy = freezed,
    Object? lastModifiedTime = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuditDetailsModelCopyWith<$Res>
    implements $AuditDetailsModelCopyWith<$Res> {
  factory _$$_AuditDetailsModelCopyWith(_$_AuditDetailsModel value,
          $Res Function(_$_AuditDetailsModel) then) =
      __$$_AuditDetailsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdBy,
      int createdTime,
      String? lastModifiedBy,
      String? lastModifiedTime});
}

/// @nodoc
class __$$_AuditDetailsModelCopyWithImpl<$Res>
    extends _$AuditDetailsModelCopyWithImpl<$Res, _$_AuditDetailsModel>
    implements _$$_AuditDetailsModelCopyWith<$Res> {
  __$$_AuditDetailsModelCopyWithImpl(
      _$_AuditDetailsModel _value, $Res Function(_$_AuditDetailsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? createdTime = null,
    Object? lastModifiedBy = freezed,
    Object? lastModifiedTime = freezed,
  }) {
    return _then(_$_AuditDetailsModel(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuditDetailsModel implements _AuditDetailsModel {
  const _$_AuditDetailsModel(
      {required this.createdBy,
      required this.createdTime,
      this.lastModifiedBy,
      this.lastModifiedTime});

  factory _$_AuditDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuditDetailsModelFromJson(json);

  @override
  final String createdBy;
  @override
  final int createdTime;
  @override
  final String? lastModifiedBy;
  @override
  final String? lastModifiedTime;

  @override
  String toString() {
    return 'AuditDetailsModel(createdBy: $createdBy, createdTime: $createdTime, lastModifiedBy: $lastModifiedBy, lastModifiedTime: $lastModifiedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuditDetailsModel &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.lastModifiedTime, lastModifiedTime) ||
                other.lastModifiedTime == lastModifiedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdBy, createdTime, lastModifiedBy, lastModifiedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuditDetailsModelCopyWith<_$_AuditDetailsModel> get copyWith =>
      __$$_AuditDetailsModelCopyWithImpl<_$_AuditDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuditDetailsModelToJson(
      this,
    );
  }
}

abstract class _AuditDetailsModel implements AuditDetailsModel {
  const factory _AuditDetailsModel(
      {required final String createdBy,
      required final int createdTime,
      final String? lastModifiedBy,
      final String? lastModifiedTime}) = _$_AuditDetailsModel;

  factory _AuditDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_AuditDetailsModel.fromJson;

  @override
  String get createdBy;
  @override
  int get createdTime;
  @override
  String? get lastModifiedBy;
  @override
  String? get lastModifiedTime;
  @override
  @JsonKey(ignore: true)
  _$$_AuditDetailsModelCopyWith<_$_AuditDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
