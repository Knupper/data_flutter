// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_schulung/test/domain/use_cases/advice_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart'
    as _i2;
import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart'
    as _i3;
import 'package:flutter_schulung/domain/entities/advice.dart' as _i6;
import 'package:flutter_schulung/domain/failures/failure.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;
import 'package:multiple_result/multiple_result.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAdviceRemoteDataSource_0 extends _i1.SmartFake
    implements _i2.AdviceRemoteDataSource {
  _FakeAdviceRemoteDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AdviceRepoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviceRepoImpl extends _i1.Mock implements _i3.AdviceRepoImpl {
  @override
  _i2.AdviceRemoteDataSource get dataSource => (super.noSuchMethod(
        Invocation.getter(#dataSource),
        returnValue: _FakeAdviceRemoteDataSource_0(
          this,
          Invocation.getter(#dataSource),
        ),
        returnValueForMissingStub: _FakeAdviceRemoteDataSource_0(
          this,
          Invocation.getter(#dataSource),
        ),
      ) as _i2.AdviceRemoteDataSource);

  @override
  _i4.Future<_i5.Result<_i6.Advice, _i7.Failure>> getAdvice(
          {String? id = r''}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdvice,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i5.Result<_i6.Advice, _i7.Failure>>.value(
            _i8.dummyValue<_i5.Result<_i6.Advice, _i7.Failure>>(
          this,
          Invocation.method(
            #getAdvice,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i5.Result<_i6.Advice, _i7.Failure>>.value(
                _i8.dummyValue<_i5.Result<_i6.Advice, _i7.Failure>>(
          this,
          Invocation.method(
            #getAdvice,
            [],
            {#id: id},
          ),
        )),
      ) as _i4.Future<_i5.Result<_i6.Advice, _i7.Failure>>);
}
