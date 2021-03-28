import 'package:flutter/material.dart';
import 'package:mars_weather_app/ui/home/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xFF091B25),
              body: FutureBuilder(
                future: model.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Stack(
                      children: [
                        Positioned(
                          left: 272.w,
                          top: -40.h,
                          child: Image(
                            image: AssetImage(
                              (() {
                                if (model.atmOpacity.toLowerCase() == 'sunny') {
                                  return 'assets/Sunny.png';
                                } else if (model.atmOpacity.toLowerCase() ==
                                    'cloudy') {
                                  return 'assets/Cloudy.png';
                                } else {
                                  return 'assets/Clear.png';
                                }
                              }()),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 40.h,
                            left: 40.w,
                            right: 40.w,
                            bottom: 40.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                model.location,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              timeLabel(model),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF353360),
                                  borderRadius: BorderRadius.circular(100.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000).withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 7,
                                      offset: Offset(0, 5),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.w,
                                      right: 16.w,
                                      top: 4.h,
                                      bottom: 4.h),
                                  child: Text(
                                    model.atmOpacity,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.sp,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 120.h,
                              ),
                              InkWell(
                                onTap: model.toggleUnit,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${model.max}° ${model.isCelsius ? 'C' : 'F'}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 96.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      Text(
                                        '| ${model.min}° ${model.isCelsius ? 'C' : 'F'}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Text(
                                        'Tap to switch to ${model.isCelsius ? 'fahrenheit' : 'celsius'}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.sp,
                                          color: Color(0xFFF47772),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 120.h,
                                        width: 334.w,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF162C38),
                                          borderRadius:
                                              BorderRadius.circular(16.0.w),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(0, 5),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 16.h,
                                            left: 40.w,
                                            right: 40.w,
                                            bottom: 16.h,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  infoColumn('Pressure:',
                                                      '${model.pressure} Pa'),
                                                  infoColumn(
                                                      'Sunset:', model.sunset),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  infoColumn(
                                                      'UV:', model.uvIndex),
                                                  infoColumn('Sunrise:',
                                                      model.sunrise),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      InkWell(
                                        onTap: model.infoButton,
                                        child: Container(
                                          width: 334.w,
                                          height: 56.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF162C38),
                                            borderRadius:
                                                BorderRadius.circular(16.0.w),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF000000)
                                                    .withOpacity(0.5),
                                                spreadRadius: 4,
                                                blurRadius: 7,
                                                offset: Offset(0, 5),
                                              )
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              'More Info',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 128.h,
                          ),
                          Image(
                            image: AssetImage('assets/Cloudy.png'),
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          CircularProgressIndicator(
                            color: Color(0xFFFFFFFF),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Getting data from Mars.\n(This should take about 5 seconds)',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'Montserrat',
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}

Widget timeLabel(model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'SOL ' + model.sol,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 36.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFFFFFF),
        ),
      ),
      Text(
        model.date,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ],
  );
}

Widget infoColumn(title, info) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18.sp,
          color: Color(0xFFFFFFFF),
        ),
      ),
      Text(
        info,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.sp,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ],
  );
}
