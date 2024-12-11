// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_schulung/test/presentation/pages/advice/advice_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:flutter_schulung/domain/use_cases/advice_use_case.dart' as _i2;
import 'package:flutter_schulung/presentation/pages/advice/cubit/advice_cubit.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

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

class _FakeAdviceUseCase_0 extends _i1.SmartFake implements _i2.AdviceUseCase {
  _FakeAdviceUseCase_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AdviceCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviceCubit extends _i1.Mock implements _i3.AdviceCubit {
  @override
  _i2.AdviceUseCase get useCase => (super.noSuchMethod(
        Invocation.getter(#useCase),
        returnValue: _FakeAdviceUseCase_0(
          this,
          Invocation.getter(#useCase),
        ),
        returnValueForMissingStub: _FakeAdviceUseCase_0(
          this,
          Invocation.getter(#useCase),
        ),
      ) as _i2.AdviceUseCase);

  @override
  _i3.AdviceState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i4.dummyValue<_i3.AdviceState>(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _i4.dummyValue<_i3.AdviceState>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.AdviceState);

  @override
  _i5.Stream<_i3.AdviceState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.AdviceState>.empty(),
        returnValueForMissingStub: _i5.Stream<_i3.AdviceState>.empty(),
      ) as _i5.Stream<_i3.AdviceState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void getAdvice({String? id = r''}) => super.noSuchMethod(
        Invocation.method(
          #getAdvice,
          [],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i3.AdviceState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i6.Change<_i3.AdviceState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
