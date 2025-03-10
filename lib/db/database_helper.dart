import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:paid_services/provider/state_notifier.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'mydatabase.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        return db.execute('''
          CREATE TABLE service (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            amount REAL NOT NULL,
            date TEXT NOT NULL,
            detail TEXT,
            icon INTEGER NOT NULL,
            color INTEGER NOT NULL,
            isPay INTEGER NOT NULL DEFAULT 0,
            expire INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
  }

  // 📌 Insertar servicio
  Future<int> insertService(Service service) async {
    try {
      final db = await database;
      return await db.insert(
        'service',
        service.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      // print("Error al insertar servicio: $e");
      return -1;
    }
  }

  // 📌 Obtener todos los servicios
  Future<List<Service>> getServices() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> result = await db.query('service');

      final parsedResult = result.map((map) => Service.fromMap(map)).toList();

      return parsedResult;
    } catch (e) {
      // print("Error al obtener servicios: $e");
      return [];
    }
  }

  // 📌 Actualizar servicio completo
  Future<int> updateService(Service service) async {
    try {
      final db = await database;
      return await db.update(
        'service',
        service.toMap(),
        where: 'id = ?',
        whereArgs: [service.id],
      );
    } catch (e) {
      // print("Error al actualizar servicio: $e");
      return -1;
    }
  }

  // 📌 Actualizar solo el estado de pago de un servicio
  Future<int> actualizarEstadoPago(int id, bool isPay) async {
    try {
      final db = await database;
      return await db.update(
        'service',
        {'isPay': isPay ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // print("Error al actualizar estado de pago: $e");
      return -1;
    }
  }

  // 📌 Eliminar servicio por ID
  Future<int> deleteService(int id) async {
    try {
      final db = await database;
      return await db.delete('service', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      // print("Error al eliminar servicio: $e");
      return -1;
    }
  }

  // 📌 Cerrar la base de datos
  Future<void> closeDatabase() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
