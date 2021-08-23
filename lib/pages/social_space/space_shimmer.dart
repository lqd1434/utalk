import 'package:flutter/material.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:shimmer/shimmer.dart';

class SpaceShimmer extends StatelessWidget {
  const SpaceShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: Shimmer.fromColors(
          baseColor: HexColor('#DADCF6'),
          highlightColor: HexColor('#BBA6E2'),
          direction: ShimmerDirection.ltr,
          loop: 100,
          period: const Duration(seconds: 2),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(5, 8, 5, 10),
                  margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration:
                                  BoxDecoration(color: HexColor('#9C78DD'), shape: BoxShape.circle),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 18,
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: HexColor('#9C78DD'),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Container(
                                    width: 90,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: HexColor('#9C78DD'),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 200,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: HexColor('#9C78DD'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              height: 17,
                              width: 300,
                              decoration: BoxDecoration(
                                color: HexColor('#9C78DD'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(color: Colors.deepPurple)
                    ],
                  ),
                );
              })),
    );
  }
}
