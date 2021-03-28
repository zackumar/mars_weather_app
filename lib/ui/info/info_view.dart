import 'package:flutter/material.dart';
import 'package:mars_weather_app/ui/info/info_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xFF091B25),
              body: Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                  left: 40.w,
                  right: 40.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        'INFO',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      section('About', model.about),
                      SizedBox(
                        height: 16.h,
                      ),
                      section('What is this?', model.whatIsThis),
                      SizedBox(
                        height: 16.h,
                      ),
                      section('Why is this?', model.whyIsThis),
                      SizedBox(
                        height: 16.h,
                      ),
                      section('What next?', model.whatNext),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Some little plugs (you can press um 😗)',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      link(
                        model,
                        'GitHub',
                        'github.com/zackumar',
                        model.github,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      link(
                        model,
                        'Website',
                        'zackumar.github.io',
                        model.website,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      link(
                        model,
                        'Blog',
                        'zackumar.github.io/blog',
                        model.blog,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      link(
                        model,
                        'Latest Project',
                        '@newpaper_snippets',
                        model.newsnips,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      section('The End!',
                          'You can go back now? I mean--if you want.'),
                      SizedBox(
                        height: 88.h,
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: model.backButton,
                icon: Icon(Icons.keyboard_backspace),
                label: Text('Back'),
                backgroundColor: Color(0xFF162C38),
              ),
            ),
        viewModelBuilder: () => InfoViewModel());
  }
}

Widget section(title, text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF),
        ),
      ),
      SizedBox(
        height: 8.h,
      ),
      Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18.sp,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ],
  );
}

Widget link(model, title, linkText, link) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title + ': ',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18.sp,
          color: Color(0xFFFFFFFF),
        ),
      ),
      InkWell(
        onTap: () async => await model.launchUrl(link),
        child: Text(
          linkText,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.sp,
            color: Color(0xFFF47772),
          ),
        ),
      )
    ],
  );
}
