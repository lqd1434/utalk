import 'action.dart';

int counterReducer(int state, dynamic action) {
  if (action.type == MyAction.change) {
    return action.data;
  }
  return state;
}