import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveWeather {
  final String hiveBox = "weatherList";

  void setWheather(String data) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    var box = await Hive.openBox(hiveBox);
    box.put("list", data);
  }

  getWheather() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    var box = await Hive.openBox(hiveBox);
    return await box.get("list");
  }
}
