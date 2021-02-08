abstract class HeadLinesStates{}

class HeadLinesInitialState extends HeadLinesStates{}
class HeadLinesLoadingState extends HeadLinesStates{}
class HeadLinesSuccessState extends HeadLinesStates{}
class HeadLinesErrorState extends HeadLinesStates{
  var error;
  HeadLinesErrorState(this.error);
}


