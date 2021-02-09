abstract class CategoryStates {}
class CategoryInitialState extends CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategorySuccessState extends CategoryStates{}
class CategoryGetMoreState extends CategoryStates{}
class CategoryErrorState extends CategoryStates{
  var error;
  CategoryErrorState(this.error);
}