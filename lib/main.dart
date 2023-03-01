import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.grey),
        home: HomePage(),
        initialRoute:HomePage.routeName,
      /*  routes: {
          HomePage.routeName:(context) => HomePage(),
          RoutePink.routeName:(context)=> RoutePink(Kullanici(ad: 'mahmut', yas: 40, adres: 'Beşiktaş')),
          RouteGreen.routeName:(context)=> RouteGreen(),
          RouteGrey.routeName:(context)=> RouteGrey(),
        },*/
        onGenerateRoute:(settings){


          switch (settings.name){
            case HomePage.routeName:
              return MaterialPageRoute(builder:(context)=>HomePage());
            case RoutePink.routeName:
              return MaterialPageRoute(builder:
                  (context)=>RoutePink(settings.arguments as Kullanici));
            case RouteGreen.routeName:
              return MaterialPageRoute(builder:(context)=>RouteGreen());
            case RouteGrey.routeName:
              return MaterialPageRoute(builder:(context)=>RouteGrey());
            default:
              return null;
          }

    }
    );
  }
}

class Kullanici {
  String ad;
  int yas;
  String adres;

  Kullanici({required this.ad, required this.yas, required this.adres});

}

class HomePage extends StatelessWidget {
  static const String routeName = '/route';
final Kullanici kullanici_1 =
  Kullanici(ad:'Metin',adres: 'Beşiktaş',yas: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            ElevatedButton(
                child: Text('Git -> Route Pink'),
                onPressed: () {

                  Navigator.pushNamed(context,RoutePink.routeName,
                  arguments: kullanici_1);

                })
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////

class RoutePink extends StatelessWidget {

  static const String routeName= '/routePink';

  final Kullanici yerelKullanici;

  RoutePink(this.yerelKullanici);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Kullanıcı Adı : ${yerelKullanici.ad},Yaşı:${yerelKullanici.yas},'
                ' Adres:${yerelKullanici.adres}'
                ),
            Text('routePink açıldı'),
            ElevatedButton(
                child: Text('Git -> Route Green'),
                onPressed: () {
                  Navigator.pushNamed(context,'/routeGreen');
                }),
            ElevatedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////

class RouteGreen extends StatelessWidget {

  static const String routeName= '/routeGreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGreen en üstte'),
            ElevatedButton(
                child: Text('Git -> Route Grey'),
                onPressed: () {
                  Navigator.pushNamed(context,'/routeGrey');
                }),
            ElevatedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context,);
                }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////

class RouteGrey extends StatelessWidget {

  static const String routeName= '/routeGrey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGrey en üstte'),
            ElevatedButton(
                child: Text('Git -> ....'),
                onPressed: () {
                  Navigator.pushNamed(context,'/routeGrey');
                }),
            ElevatedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}