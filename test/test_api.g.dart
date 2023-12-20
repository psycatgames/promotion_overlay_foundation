// Copyright 2023 PsyCat Games (https://psycatgames.com/). All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v10.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, unnecessary_import
// ignore_for_file: avoid_relative_lib_imports
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;
import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:promotion_overlay_foundation/messages.g.dart';

abstract class TestPromotionOverlayApi {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding =>
      TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> codec = StandardMessageCodec();

  bool show(String appIdentifier, String? campaignToken, String? providerToken,
      bool dismissOnBackground, int position);

  bool dismiss();

  static void setup(TestPromotionOverlayApi? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.show',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger
            .setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger
            .setMockDecodedMessageHandler<Object?>(channel,
                (Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.show was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_appIdentifier = (args[0] as String?);
          assert(arg_appIdentifier != null,
              'Argument for dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.show was null, expected non-null String.');
          final String? arg_campaignToken = (args[1] as String?);
          final String? arg_providerToken = (args[2] as String?);
          final bool? arg_dismissOnBackground = (args[3] as bool?);
          assert(arg_dismissOnBackground != null,
              'Argument for dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.show was null, expected non-null bool.');
          final int? arg_position = (args[4] as int?);
          assert(arg_position != null,
              'Argument for dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.show was null, expected non-null int.');
          final bool output = api.show(arg_appIdentifier!, arg_campaignToken,
              arg_providerToken, arg_dismissOnBackground!, arg_position!);
          return <Object?>[output];
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.promotion_overlay_foundation.PromotionOverlayApi.dismiss',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger
            .setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger
            .setMockDecodedMessageHandler<Object?>(channel,
                (Object? message) async {
          // ignore message
          final bool output = api.dismiss();
          return <Object?>[output];
        });
      }
    }
  }
}
