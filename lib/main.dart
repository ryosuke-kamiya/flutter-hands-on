import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// main()はFlutterアプリケーションのエントリポイントです
// main()の中で、runAppにルートとなるウィジェットを格納して呼ぶ必要があります
void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUZURI"),
      ),
      body: _productsList(context), // bodyで表示したいウィジェットを別のメソッドに切り出す
    );
  }
}

// Widgetを返すメソッド
// 引数はBuildContextで、呼び出し側のbuildで持っているものを渡す
Widget _productsList(BuildContext context) {
  return Container(
    // GridViewはウィジェットをグリッドで表示してくれるウィジェット
    // iOS UIKitで言うところの UICollectionView
    // GridView.builderというfactory(カスタムコンストラクタ)で初期化する
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // グリッド横方向のウィジェット数
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        // グリッド表示するウィジェットの縦横比
        childAspectRatio: 0.7,
      ),
      // グリッドに表示したいウィジェットの数
      itemCount: 6,
      // itemBuilderはGridViewのインデックス毎に表示したいウィジェットを返すデリゲート
      // context, indexを引数にとり、ウィジェットを返す関数を指定してやる
      // itemContの回数だけ呼ばれる、この例では6回
      itemBuilder: (context, index) {
        // とりあえずグレーのコンテナを表示してみる
        return Container(
          color: Colors.grey,
          margin: EdgeInsets.all(16),
        );
      }
    ),
  );
}
