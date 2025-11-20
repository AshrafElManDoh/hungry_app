import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ToppingItem extends StatelessWidget {
  const ToppingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: buildBorderRadius(),
      child: Container(
        height: 100,
        width: 85,
        decoration: BoxDecoration(
          color: Color(0xff3C2F2F),
          borderRadius: buildBorderRadius(),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: buildBorderRadius(),
                color: Colors.white,
              ),
              child: Image.asset("assets/test/tomato.png"),
            ),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Tomato",style: TextStyle(color: Colors.white,fontSize: 12),),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add,size: 16,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  BorderRadius buildBorderRadius() => BorderRadius.circular(18);

}
