import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/Cubit/States.dart';
import 'package:news_app/Layout/Cubit/cubit.dart';
import 'package:news_app/Models/Components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var List = NewsCubit.get(context).science;
    return articleBuilder(List, context);
    }
      );
  }
}
