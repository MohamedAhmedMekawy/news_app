
abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetSuccessBusines extends NewsStates{}
class NewsLoadingBusinesStates extends NewsStates{}
class NewsBusinessError extends NewsStates{
  final String error;
  NewsBusinessError(this.error);
}
class NewsGetSucssesSports extends NewsStates{}
class NewsGetLoadingSports extends NewsStates{}
class NewsSportsError extends NewsStates{
  final String error;
  NewsSportsError(this.error);
}
class NewsGetSuccessScience extends NewsStates{}
class NewsLoadingScienceStates extends NewsStates{}
class NewsScienceError extends NewsStates{
  final String error;
  NewsScienceError(this.error);
}
class AppChangeMode extends NewsStates{}

class NewsGetSearchState extends NewsStates{}
class NewsLoadingSearchStates extends NewsStates{}
class NewsSearchError extends NewsStates{
  final String error;
  NewsSearchError(this.error);
}