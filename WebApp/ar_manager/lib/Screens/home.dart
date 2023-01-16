import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*

import 'package:flutter/material.dart';
import '../Widgets/machine_component.dart';
import '../Widgets/title.dart';

class MachineHomePage extends StatefulWidget {
  const MachineHomePage({super.key});

  @override
  State<MachineHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MachineHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const MachineTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FractionallySizedBox(
              widthFactor: 1,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 50),
                child: const Text(
                  'SELECT A MACHINE TO SEE DETAILS',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
          ],
        ),
      ),
    );
  }
}
*/
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override 
  _HomeState createState() => _HomeState();
  
}
  class _HomeState extends State<Home>{
    final _formKey = GlobalKey<FormState>();
      
    @override
    Widget build(BuildContext context){
    return Scaffold (
      appBar: 
      AppBar(title: const Text('Home',
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w200,
        fontStyle:FontStyle.normal 
        )),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
            )
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,      
                children: <Widget>[
                 
                  ElevatedButton (
                      onPressed: () => context.go('/machine'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Machines',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w200,
                          fontStyle:FontStyle.normal 
                      )
                      ),
                    ), ElevatedButton (
                      onPressed: () => context.go('/zone'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Zone',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w200,
                          fontStyle:FontStyle.normal 
                      )
                      ),
                    ), ElevatedButton (
                      onPressed: () => context.go('/data'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Data',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w200,
                          fontStyle:FontStyle.normal 
                      )
                      ),
                    ),
                ]
        )
      )    
                
    );
    }
    }