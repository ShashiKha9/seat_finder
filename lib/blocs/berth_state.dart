part of 'berth_bloc.dart';

 class BerthState extends Equatable {
   final Color color;
   BerthState(this.color);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class BerthInitial extends BerthState {
  BerthInitial(super.color);

  @override
  List<Object> get props => [];
}
