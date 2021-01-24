import 'package:flutter/material.dart';

class PageModel {
  String _images;
  String _title;
  String _discrabtion;
  IconData _icon;

  PageModel(this._images, this._title, this._discrabtion, this._icon);
  String get images => _images;
  String get title => _title;
  String get discrabtion => _discrabtion;
  IconData get icon => _icon;
}