import 'package:flutter/material.dart';
class AnimeTile extends StatelessWidget {

  final String animePoster;
  final String animeName;
  //final AsyncSnapshot snapshot;

  AnimeTile({
    super.key,
    required this.animePoster,
    required this.animeName,
    //required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Container(
        height: 200,
        width: 130,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            color: Colors.grey[900],
          image: DecorationImage(
              image: NetworkImage(animePoster),
            fit: BoxFit.cover
          )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                      child: Container()),
                  Expanded(
                    child: ClipRRect(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[800]?.withOpacity(0.7),
                        ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Text(
                          animeName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
