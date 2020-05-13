// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobertura_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoberturaForm on _CoberturaForm, Store {
  final _$dscAtom = Atom(name: '_CoberturaForm.dsc');

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

  final _$msgDscAtom = Atom(name: '_CoberturaForm.msgDsc');

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

  final _$_CoberturaFormActionController =
      ActionController(name: '_CoberturaForm');

  @override
  bool validarDsc(String value) {
    final _$actionInfo = _$_CoberturaFormActionController.startAction();
    try {
      return super.validarDsc(value);
    } finally {
      _$_CoberturaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'dsc: ${dsc.toString()},msgDsc: ${msgDsc.toString()}';
    return '{$string}';
  }
}
