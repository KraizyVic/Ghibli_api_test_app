import 'package:flutter/material.dart';
import 'package:ghibliapi/pages/home_page.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
              "lib/assets/cropped-1170-2532-1311453.jpg",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black,Colors.black.withOpacity(0.4)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
                "Ghibli Api Test App\n v 1.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            child: Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context)=>HomePage(),
                    ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      child: Text(
                          "Next",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
