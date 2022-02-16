import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Moduls/WebView/WebView.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),

              image: DecorationImage(

                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover

              )

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

              height: 120,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 4,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: TextStyle(

                      color: Colors.grey

                  ),

                  )

                ],

              )

          ),

        )



      ],

    ),

  ),
);
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    height: 1,
    color: Colors.grey[300],

  ),
);
Widget articleBuilder(List, context) => ConditionalBuilder(
    condition:List.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(List[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10),
    fallback: (context) => Center(
      child: CircularProgressIndicator(),
    )
);
void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget),);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  void Function(String)? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function  validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
     // onFieldSubmitted: onSubmit,
      onChanged: onChange,
      //onTap: onTap,
      //validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
      /*  suffixIcon: suffix != null
            ? IconButton(
          //onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,*/
        border: OutlineInputBorder(),
      ),
    );