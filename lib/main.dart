// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
/// stock bull and sell

class segment{
  int buyDay;
  int sellDay;

  segment (this.buyDay,this.sellDay);
}

List<segment> profitSegment(List<int> costs){
  List<segment> seg=[];
  int n=costs.length;
  int buyDay=0;


  for(int i=1; i<n;i++){
    if(costs[i]>costs[i-1]){
      seg.add(segment(buyDay, i-1));
    }
  }
  if(buyDay< n-1){
    seg.add(segment(buyDay, n-1));
  }
  return seg;
}

void main(){
  List<int> price=[4,2,2,2,4];
  List<segment> result= profitSegment(price);

  if (result.isEmpty){
    print("no profit segment found");
  }else{
    for(var seg in result){
      int buyDay=seg.buyDay;
      int sellDay=seg.sellDay;
      print("we can buy stock on ${buyDay+1} , and sell it on ${sellDay+1}");
    }
  }

}


/// permutation

void permutaion(String S){
  List<String> output=[];
  resultedPremutation(S.split(''),0,output);
  output.sort();

  for(String per in output){
    print(per);
  }
}

void resultedPremutation(List<String>arr,int index, List<String>output){
  if(index==arr.length-1){
    output.add(arr.join(''));
    return;
  }

  Set<String> utilized={};
  for(int i=index;i<arr.length;i++){
    if(utilized.contains(arr[i]))continue;
    utilized.add(arr[i]);

    String temp=arr[index];
    arr[index]=arr[i];
    arr[i]=temp;

    resultedPremutation(List.from(arr), index+1, output);

    arr[i]=arr[index];
    arr[index]=temp;
  }

}

void main(){
  String S="ABSG";
  permutaion(S);
}

/// rearrange the array

List<int> rearrangingTheArray(List<int> arr){
  int n=arr.length;
  List<int> output=List.filled(n, 0);

  int leftElement=0;
  int rightElement=n-1;
  int index=0;

  while(leftElement<=rightElement){
    if(index%2==0){
      output[index]=arr[rightElement];
      rightElement--;
    }else{
      output[index]=arr[leftElement];
      leftElement++;
    }
    index++;
  }
  return output;
}

void main(){
  List<int> arr =[1,2,3,4,5,6];
  List<int> result=rearrangingTheArray(arr);
  String output=result.join();
  print('$result');
}