import 'dart:typed_data';
import '../utils/all_utils.dart';

class DemoSecurityVM {
  static String securityKey =
      'eb2d9519f39d359c7530943092453879e7b3556e5550feb0c25c7fd2bf68cffe';

  static Uint8List generateEncryptionKey() {
    var reversedChars = securityKey.split('');
    final reversedKey = reversedChars.reversed.join();
    final crc = CrcUtils.convert(Utf8Utils.encode(reversedKey));
    final xorKey =
        XorUtils.encrypt(Utf8Utils.encode(reversedKey), Utf8Utils.encode(crc));
    final finalKey = ShaUtils.convert(xorKey);
    return finalKey;
  }

  static Uint8List generateEncryptionIV() {
    final crc = CrcUtils.convert(Utf8Utils.encode(securityKey));
    final hex = HexUtils.encode(Utf8Utils.encode(crc));
    final rep = hex * 32;
    final prefix = rep.substring(0, 32);
    return HexUtils.decode(prefix);
  }

  static Uint8List doubleEncrypt(Uint8List plain) {
    if (plain.isNotEmpty) {
      var finalKey = generateEncryptionKey();
      final encrypted =
          AesUtils.encrypt(plain, finalKey, generateEncryptionIV());
      return encrypted;
    } else {
      return Uint8List(0);
    }
  }

  static Uint8List doubleDecrypt(Uint8List encrypted) {
    if (encrypted.isNotEmpty) {
      var finalKey = generateEncryptionKey();
      final decrypted =
          AesUtils.decrypt(encrypted, finalKey, generateEncryptionIV());
      return decrypted;
    } else {
      return Uint8List(0);
    }
  }
}
