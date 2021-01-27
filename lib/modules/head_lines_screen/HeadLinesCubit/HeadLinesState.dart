abstract class HeadLinesStates{}

class HeadLinesInitialState extends HeadLinesStates{}
class HeadLinesLoadingState extends HeadLinesStates{}
class HeadLinesSuccessState extends HeadLinesStates{}
class HeadLinesErrorState extends HeadLinesStates{
  String error;
  HeadLinesErrorState(this.error);
}


