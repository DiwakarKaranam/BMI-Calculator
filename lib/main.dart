import 'package:flutter/material.dart';
import 'result.dart';
void main() {
  runApp(const MaterialApp(
    home:MyApp(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

Color c = const Color(0xff4a32a8);
Color mc = const Color(0xff4a32a8);
Color fc = const Color(0xff4a32a8);
int height = 180;
int weight = 60;
void changecolor(int a) {
  if (a == 1) {
    if (mc == const Color(0xff4a32a8))
      mc = Color(0xff3a0e5c);
    else
      mc = Color(0xff4a32a8);
  } else {
    if (fc == Color(0xff4a32a8))
      fc = Color(0xff3a0e5c);
    else
      fc = Color(0xff4a32a8);
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          backgroundColor: const Color(0xff4a32a8),
          title: Container(
            child: Row(children: const [
              Icon(Icons.calculate),
              Text(' BMI Calculator')
            ]),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            changecolor(1);
                          });
                        },
                        child: card(a: 'MALE', i: Icons.male, co: mc)),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            changecolor(0);
                          });
                        },
                        child: card(a: 'FEMALE', i: Icons.female, co: fc)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: c,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.height,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            'HEIGHT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                height.toString(),
                                style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),
                              ),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SliderTheme(
                              data:SliderThemeData(trackHeight:1,inactiveTrackColor: Colors.purpleAccent),
                              child: Expanded(
                                child: Slider(
                                  value: height.toDouble(),
                                  min: 120,
                                  activeColor: Colors.white,
                                  max: 220,
                                  thumbColor: Colors.red,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.toInt();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: c,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.scale,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            'WEIGHT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                weight.toString(),
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),
                              ),
                            ),
                            Container(
                              child: Text(
                                'kg',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SliderTheme(
                        data:SliderThemeData(trackHeight:1,inactiveTrackColor: Colors.purpleAccent),
                              child: Expanded(
                                child: Slider(
                                  value: weight.toDouble(),
                                  activeColor: Colors.white,
                                  secondaryActiveColor: Colors.white,
                                  min: 0,
                                  thumbColor: Colors.red,
                                  max: 100,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      weight = newValue.round();
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                if(height!=0)
                { double k=height/100;
                  double a= weight/(k*k);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(a:a.toStringAsFixed(1))),);}
              },
              child: Container(

               margin: EdgeInsets.only(left: 0,top: 1,bottom: 0,right: 0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
            ),
          ],
        ),
      );
  }
}

class card extends StatelessWidget {
  card({super.key, required this.a, required this.i, required this.co});
  String a;
  IconData i;
  Color co;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: co,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              i,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                a,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}



