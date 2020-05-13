// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidade_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EspecialidadeForm on _EspecialidadeForm, Store {
  final _$dscAtom = Atom(name: '_EspecialidadeForm.dsc');

  @override
  String get dsc {
    _$dscAtom.context.enforceReadPolicy(_$dscAtom);
    _$dscAtom.reportObserved();
    return super.dsc;
  }

  @override
  set dsc(String value) {
    _$dscAtom.context.conditionallyRunInAction(() {
      super.dsc = value;
      _$dscAtom.reportChanged();
    }, _$dscAtom, name: '${_$dscAtom.name}_set');
  }

  final _$msgDscAtom = Atom(name: '_EspecialidadeForm.msgDsc');

  @override
  String get msgDsc {
    _$msgDscAtom.context.enforceReadPolicy(_$msgDscAtom);
    _$msgDscAtom.reportObserved();
    return super.msgDsc;
  }

  @override
  set msgDsc(String value) {
    _$msgDscAtom.context.conditionallyRunInAction(() {
      super.msgDsc = value;
      _$msgDscAtom.reportChanged();
    }, _$msgDscAtom, name: '${_$msgDscAtom.name}_set');
  }

  final _$_EspecialidadeFormActionController =
      ActionController(name: '_EspecialidadeForm');

  @override
  bool validarDsc(String value) {
    final _$actionInfo = _$_EspecialidadeFormActionController.startAction();
    try {
      return super.validarDsc(value);
    } finally {
      _$_EspecialidadeFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'dsc: ${dsc.toString()},msgDsc: ${msgDsc.toString()}';
    return '{$string}';
  }
}
