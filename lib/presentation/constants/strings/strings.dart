// Box Hive
import 'dart:io';

import '../../../assistant_methode/hivebase.dart';

const settingsBoxHive = "settings";
const driverBoxHive = "driver";
const bgNotificationBox = "backgroundNotificationBox";
// Hive Key
const driverHiveKey = "RiderKey";
const departureStationHiveKey = "departureStationKey";
const arrivalStattionHiveKey = "arrivalStattionKey";
const tokenHiveKey = "TokenKey";
const languageHiveKey = "LanguageKey";
const onBordingHiveKey = "onBordingKey";
const pandingHiveKey = "pandingKey";
const loginHiveKey = "loginKey";
const completeProfileHiveKey = "completeProfileKey";
const bgNotificationHiveKey = "bgNotificationKey";
// Path assets
const pngsPath = 'assets/pngs';
const svgsPath = 'assets/svgs';
const gifsPath = 'assets/gifs';

//Base Url
String baseUrl = '';

//Token FCM
String? tokenFcm;

// Device info
String? brand;
String? model;
String? version;
//
// List of languages
List<Map<String, String>> languages = [
  {'name': 'ar', 'flag': '🇩🇿'},
  {'name': 'fr', 'flag': '🇫🇷'},
  {'name': 'en', 'flag': '🇬🇧'},
];

// Map of language

Map<String, String>? selectedLanguage;
