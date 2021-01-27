abstract class DetailsStates {}
class DetailsInitialState extends DetailsStates{}
class DetailsLoadingState extends DetailsStates{}
class DetailsSuccessState extends DetailsStates{}
class DetailsErrorState extends DetailsStates{
  String error;
  DetailsErrorState(this.error);
}