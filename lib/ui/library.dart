library ui.library;

import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '/cubit/crypto_asset_cubit.dart';
import '/cubit/live_prices_cubit.dart';
import '../../model/live_price.dart';
import '../helpers/constants.dart';

part 'home_screen.dart';
part 'widgets/live_prices.dart';
part 'widgets/profile.dart';
part 'widgets/balance_card.dart';
part 'widgets/crypto_asset.dart';
part 'widgets/cached_circle_avatar.dart';
