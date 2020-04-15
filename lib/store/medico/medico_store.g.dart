// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medico_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicoStore on _MedicoStore, Store {
  final _$nomeAtom = Atom(name: '_MedicoStore.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$crmAtom = Atom(name: '_MedicoStore.crm');

  @override
  int get crm {
    _$crmAtom.context.enforceReadPolicy(_$crmAtom);
    _$crmAtom.reportObserved();
    return super.crm;
  }

  @override
  set crm(int value) {
    _$crmAtom.context.conditionallyRunInAction(() {
      super.crm = value;
      _$crmAtom.reportChanged();
    }, _$crmAtom, name: '${_$crmAtom.name}_set');
  }

  final _$telefoneAtom = Atom(name: '_MedicoStore.telefone');

  @override
  int get telefone {
    _$telefoneAtom.context.enforceReadPolicy(_$telefoneAtom);
    _$telefoneAtom.reportObserved();
    return super.telefone;
  }

  @override
  set telefone(int value) {
    _$telefoneAtom.context.conditionallyRunInAction(() {
      super.telefone = value;
      _$telefoneAtom.reportChanged();
    }, _$telefoneAtom, name: '${_$telefoneAtom.name}_set');
  }

  final _$enderecoAtom = Atom(name: '_MedicoStore.endereco');

  @override
  Endereco get endereco {
    _$enderecoAtom.context.enforceReadPolicy(_$enderecoAtom);
    _$enderecoAtom.reportObserved();
    return super.endereco;
  }

  @override
  set endereco(Endereco value) {
    _$enderecoAtom.context.conditionallyRunInAction(() {
      super.endereco = value;
      _$enderecoAtom.reportChanged();
    }, _$enderecoAtom, name: '${_$enderecoAtom.name}_set');
  }

  final _$msgNomeAtom = Atom(name: '_MedicoStore.msgNome');

  @override
  String get msgNome {
    _$msgNomeAtom.context.enforceReadPolicy(_$msgNomeAtom);
    _$msgNomeAtom.reportObserved();
    return super.msgNome;
  }

  @override
  set msgNome(String value) {
    _$msgNomeAtom.context.conditionallyRunInAction(() {
      super.msgNome = value;
      _$msgNomeAtom.reportChanged();
    }, _$msgNomeAtom, name: '${_$msgNomeAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},crm: ${crm.toString()},telefone: ${telefone.toString()},endereco: ${endereco.toString()},msgNome: ${msgNome.toString()}';
    return '{$string}';
  }
}
