
class AppConst {
  static const String tableNotes = 'notes';
  static const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const textType = 'TEXT NOT NULL';
  static const integerType = 'INTEGER NOT NULL';

 static  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }

}
