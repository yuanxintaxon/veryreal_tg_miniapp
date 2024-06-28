import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:veryreal_common/veryreal_common.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
///
class CacheController extends GetxController {
  final favoriteList = <EmojiInfo>[].obs;
  final callRecordList = <CallRecords>[].obs;
  final moneyPacketStatusMap = <String, String>{}.obs;
  Box? favoriteBox;
  Box? callRecordBox;
  late final Box moneyPacketStatusBox;
  bool _isInitFavoriteList = false;
  bool _isInitCallRecords = false;
  bool _isInitMoneyPacketStatusMap = false;

  Future<String> get userID async =>
      (await DataSp.getLoginCertificate())!.userID;

  List<String> get urlList => favoriteList.map((e) => e.url!).toList();

  initFavoriteEmoji() {
    if (!_isInitFavoriteList) {
      _isInitFavoriteList = true;
      var list = favoriteBox?.get(userID, defaultValue: <EmojiInfo>[]);
      if (list != null) {
        favoriteList.assignAll((list as List).cast());
      }
    }
  }

  void addFavoriteFromUrl(String? url, int? width, int? height) {
    var emoji = EmojiInfo(url: url, width: width, height: height);
    favoriteList.insert(0, emoji);
    favoriteBox?.put(userID, favoriteList);
  }

  void addFavoriteFromPath(String path, int width, int height) async {
    /// TOREPLACE
    /*
    var result = await LoadingView.singleton.wrap(
      asyncFunction: () => OpenIM.iMManager.uploadFile(
        id: const Uuid().v4(),
        filePath: path,
        fileName: path,
      ),
      // asyncFunction: () => HttpUtil.uploadImageForMinio(path: path),
    );
    if (result is String) {
      final url = jsonDecode(result)['url'];
      Logger.print('url:$url');
      var emoji = EmojiInfo(url: url, width: width, height: height);
      Logger.print('addFavoriteFromPath :$url');
      favoriteList.insert(0, emoji);
      favoriteBox?.put(userID, favoriteList);
    }
    */
  }

  void delFavorite(String url) {
    favoriteList.removeWhere((element) => element.url == url);
    favoriteBox?.put(userID, favoriteList);
  }

  void delFavoriteList(List<String> urlList) {
    for (final url in urlList) {
      favoriteList.removeWhere((element) => element.url == url);
    }
    favoriteBox?.put(userID, favoriteList);
  }

  initCallRecords() {
    if (!_isInitCallRecords) {
      _isInitCallRecords = true;
      var list = callRecordBox?.get(userID, defaultValue: <CallRecords>[]);
      if (list != null) {
        callRecordList.assignAll((list as List).cast());
      }
    }
  }

  addCallRecords(CallRecords records) {
    callRecordList.insert(0, records);
    callRecordBox?.put(userID, callRecordList);
  }

  deleteCallRecords(CallRecords records) async {
    callRecordList.removeWhere((element) =>
        element.userID == records.userID && element.date == records.date);
    await callRecordBox?.put(userID, callRecordList);
  }

  initMoneyPacketStatus() {
    if (!_isInitMoneyPacketStatusMap) {
      _isInitMoneyPacketStatusMap = true;
      final map =
          moneyPacketStatusBox.get(userID, defaultValue: <String, String>{});
      if (map != null) {
        moneyPacketStatusMap.assignAll((map as Map).cast());
      }
    }
  }

  addMoneyPacketStatus(String serialNo, String moneyPacketStatusString) {
    moneyPacketStatusMap[serialNo] = moneyPacketStatusString;
    moneyPacketStatusBox.put(userID, Map.from(moneyPacketStatusMap));
  }

  void resetCache() {
    if (_isInitCallRecords) {
      final list = callRecordBox?.get(userID, defaultValue: <CallRecords>[]);
      if (list != null) {
        callRecordList.assignAll((list as List).cast());
      }
    }

    if (_isInitFavoriteList) {
      final list = favoriteBox?.get(userID, defaultValue: <EmojiInfo>[]);
      if (list != null) {
        favoriteList.assignAll((list as List).cast());
      }
    }

    if (_isInitMoneyPacketStatusMap) {
      final map =
          moneyPacketStatusBox.get(userID, defaultValue: <String, String>{});
      if (map != null) {
        moneyPacketStatusMap.assignAll((map as Map).cast());
      }
    }
  }

  @override
  void onClose() {
    _isInitFavoriteList = false;
    _isInitCallRecords = false;
    Hive.close();
    super.onClose();
  }

  @override
  void onInit() async {
    // Register Adapter
    Hive.registerAdapter(EmojiInfoAdapter());
    Hive.registerAdapter(CallRecordsAdapter());
    // open
    favoriteBox = await Hive.openBox<List>('favoriteEmoji');
    callRecordBox = await Hive.openBox<List>('callRecords');
    moneyPacketStatusBox = await Hive.openBox<Map>('moneyPacketStatus');

    /// for testing money packet status cache
    // moneyPacketStatusBox.clear();
    super.onInit();
  }
}
