import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/*
 * Created by Nimish Nandwana on 04/07/2021.
 * Description - 
 */

abstract class NavigationAction extends Equatable {}

@immutable
class DisplayToast extends NavigationAction {
  DisplayToast({
    required this.message,
    this.isError = false,
  });

  final String message;
  final bool isError;

  @override
  List<Object?> get props => [message, isError];
}

class DisplayScreen extends NavigationAction {
  DisplayScreen({
    required this.screenName,
    this.data,
  });

  final String screenName;
  final Object? data;

  @override
  List<Object?> get props => [screenName, data];
}

class DisplayLoader extends NavigationAction {
  DisplayLoader({
    this.data,
  });

  final Object? data;

  @override
  List<Object?> get props => [data];
}

class HideLoader extends NavigationAction {
  HideLoader({
    this.data,
  });

  final Object? data;

  @override
  List<Object?> get props => [data];
}

class DispatchAction extends NavigationAction {
  DispatchAction({
    required this.actionName,
    this.data,
  });

  final String actionName;
  final Object? data;

  @override
  List<Object?> get props => [actionName, data];
}
