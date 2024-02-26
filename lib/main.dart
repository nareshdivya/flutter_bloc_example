

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/app.dart';
import 'package:flutter_research/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp( App());
}