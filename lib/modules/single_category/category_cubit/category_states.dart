abstract class CategoryStates {}
class CategoryInitialState extends CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategorySuccessState extends CategoryStates{}
class CategoryErrorState extends CategoryStates{
  String error;
  CategoryErrorState(this.error);
}