import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoViewModel extends BaseViewModel {
  var _context;

  String about =
      'Hi all 👋! My name’s Zack Umar and this is my submission for RowdyHacks 2021. This was made in about 6 hours because my schedule was pretty busy, but I definitely still wanted to participate. So it isn\'t the best nor is it the most full fledged thing ever';

  String whatIsThis =
      'This is a weather app for mars! Because who wants useful weather info? It uses NASA’s open API for InSight, their weather station at the Elysium Planitia, as well as the Rover Environmental Monitoring Station (REMS) on the Curiosity Rover using web scraping.\n\nIt is sadly not real-time because it takes a few days for the spacecraft to beam down the data. So we’re about 4-5 days behind. Sads 😔.';

  String whyIsThis =
      'Good question. Who really knows to be honest. 🤷. I had trouble coming up with ideas that I could fit in my busy schedule but found NASA’s open APIs and one thing led to another.';

  String whatNext =
      'I definitely want to add more to this. It ain’t done yet. I want to build a machine learning model to be able to predict the weather for the upcoming days (and days that haven’t been beamed down yet), but that time crunch of 6 hours didn’t really give me the time for that. Maybe also show past weather? I also want to do some quality-of-life stuff with some UI/UX changes. More animations and data would be great!';

  String github = 'https://www.github.com/zackumar';
  String website = 'https:/zackumar.github.io';
  String blog = 'https:/zackumar.github.io/blog';
  String newsnips = 'https://www.instagram.com/newspaper_snippets/';

  void init(context) {
    _context = context;
  }

  void backButton() {
    Navigator.pop(_context);
  }

  void launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Error opening link. Sorry :(');
    }
  }
}
