// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Saved Posts`
  String get savedPosts {
    return Intl.message(
      'Saved Posts',
      name: 'savedPosts',
      desc: '',
      args: [],
    );
  }

  /// `View Comments`
  String get viewComments {
    return Intl.message(
      'View Comments',
      name: 'viewComments',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Post Details`
  String get postDetails {
    return Intl.message(
      'Post Details',
      name: 'postDetails',
      desc: '',
      args: [],
    );
  }

  /// `Unable to delete post`
  String get unableToDeletePosts {
    return Intl.message(
      'Unable to delete post',
      name: 'unableToDeletePosts',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving comments`
  String get anErrorOccurredWhileSavingComments {
    return Intl.message(
      'An error occurred while saving comments',
      name: 'anErrorOccurredWhileSavingComments',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving post`
  String get anErrorOccurredWhileSavingPost {
    return Intl.message(
      'An error occurred while saving post',
      name: 'anErrorOccurredWhileSavingPost',
      desc: '',
      args: [],
    );
  }

  /// `No comments deleted`
  String get noCommentsDeleted {
    return Intl.message(
      'No comments deleted',
      name: 'noCommentsDeleted',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get anUnexpectedErrorOccurred {
    return Intl.message(
      'An unexpected error occurred',
      name: 'anUnexpectedErrorOccurred',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
