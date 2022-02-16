import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/Cubit/States.dart';
import 'package:news_app/Moduls/Science/science_screen.dart';
import 'package:news_app/Moduls/Settings/setting_screen.dart';
import 'package:news_app/Moduls/Sports/sports_screen.dart';
import 'package:news_app/Moduls/busieness/business_screen.dart';
import 'package:news_app/Shared/Cubit/state.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined),
        label: 'Science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'),

  ];
  List<Widget> screens = [
    const BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];

  void BottomNavChange(int index) {
    currentIndex = index;
    if (index == 1)
      getScience();
    if (index == 2)
      getSports();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingBusinesStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsLoadingScienceStates());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'abf3c58f819245c99c7ca7678cbefc6b',
        },).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetSuccessScience());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceError(error.toString()));
      });
    }
    else {
      emit(NewsGetSuccessScience());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetLoadingSports());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
      }).catchError((error) {
        print(error.toString());
      }
      );
    }
    else {
      emit(NewsGetLoadingSports());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsLoadingSearchStates());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchError(error.toString()));
    });
  }
}
