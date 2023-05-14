import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'berth_event.dart';
part 'berth_state.dart';

class BerthBloc extends Bloc<BerthEvent, BerthState> {
  BerthBloc() : super(BerthInitial(Colors.grey)) {
    on<BerthEvent>((event, emit) {
      // if(event is ){
      //
      // }


    });
  }
}
