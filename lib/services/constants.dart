import 'package:flutter/material.dart';
final String keyToken = "tokenForWbApi";
final String apiKey = "yrgz6aBAss8tq2Qh8MJPt99SPItXPShE161bsZ36";
final String baseURLStaging = "http://13.52.75.228:9009/v1";
final String baseURLProduction = "https://assettrack.dev.volteo.io/api/v1";
final  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


final connectTimeout = 15000;
final String navigateTo = "navigateTo";
var drawerIcons = [
    Icon(Icons.move_to_inbox),
    Icon(Icons.inbox),
    Icon(Icons.people),
    Icon(Icons.local_offer),
    Icon(Icons.star),
    Icon(Icons.access_time),
    Icon(Icons.label),
    Icon(Icons.send),
    Icon(Icons.send),
    Icon(Icons.note),
    Icon(Icons.mail),
    Icon(Icons.error),
    Icon(Icons.delete),
    Icon(Icons.label),
    Icon(Icons.label),
    Icon(Icons.settings),
    Icon(Icons.help),
  ];

  var drawerText = [
    "All inboxes",
    "Primary",
    "Social",
    "Promotions",
    "Starred",
    "Snoozed",
    "Important",
    "Sent",
    "Outbox",
    "Drafts",
    "All mail",
    "Spam",
    "Bin",
    "[Imap]/Sent",
    "[Imap]/Trash",
    "Settings",
    "Help & feedback"
  ];

  var titleBarContent = "REQUEST QUEUE";