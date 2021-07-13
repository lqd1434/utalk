// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/cupertino.dart';

@immutable
class CountState{
  int _currentIndex;
  get currentIndex => _currentIndex;

  CountState(this._currentIndex);

  CountState.initState() : _currentIndex = 0;
}


