import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/models/product.dart';
import 'package:task/models/product_image.dart';

class DatabaseService {
  static Database? _db;
  Future<Database> get db async {
    _db ??= await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    _db ??= await openDatabase(join(await getDatabasesPath(), 'task_database.db'), version: 1, onCreate: _onCreate, );
    return _db!;
  }

  void _onCreate(Database db, int version) async {
    await  db.execute(
      'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, shop TEXT, price REAL, type INTEGER )',
    );
    await  db.execute(
      'CREATE TABLE products_images(id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT, product_id INTEGER, FOREIGN KEY(product_id) REFERENCES products(id) )',
    );
  }

  Future<Product> insert(Product product) async {
    final db = await this.db;
    product.id = await db.insert("products", product.toMap());

    for (final image in product.images) {
      await db.insert("products_images", {
        "product_id": product.id,
        "data": image.data,
      });
    }

    return product;
  }

  Future<List<Product>> select(int? type) async {
    final db = await this.db;
    final res = await db.query("products", where: type != null && type != 0 ? "type == $type" : null);
    List<Product> resault = [];

    for (final m in res){
      final product = Product.fromMap(m);
      final images = await db.query("products_images", where: "product_id = ${product.id}");
      for(final image in images) {
        product.images.add(ProductImage.fromMap(image));
      }
      resault.add(product);
    }

    return resault;
  }
}
