import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/utils/data.dart';

class SkillsWidget extends StatefulWidget {
  final Size size;
  const SkillsWidget({super.key, required this.size});

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      double minScrollExtent = controller.position.minScrollExtent;
      double maxScrollExtent = controller.position.maxScrollExtent;
      animateToMaxMin(
          maxScrollExtent, minScrollExtent, maxScrollExtent, 15, controller);
    });
  }

  animateToMaxMin(double max, double min, double direction, int second,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: second), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, second, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Personal Skills',
          style: GoogleFonts.prata(
              textStyle: TextStyle(
                  fontSize: widget.size.height * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3, left: 20, right: 20),
          child: Container(
            height: MediaQuery.of(context).size.height /
                3.5, // Adjusted height to accommodate both the container and text
            child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: DataSet.isColor.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: MediaQuery.of(context).size.height /
                              5, // Container height
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blueGrey.shade700,
                                    blurRadius: 6,
                                    spreadRadius: 4)
                              ],
                              image: DecorationImage(
                                  image: AssetImage(DataSet.isColor[index]),
                                  fit: BoxFit.fill),
                              color: Colors.white),
                        ),
                        const SizedBox(
                            height:
                                10), // Spacing between the container and the text
                        // Display the name corresponding to each container
                        Text(
                          DataSet.text[
                              index], // Assuming you have a list of names for each container
                          style: GoogleFonts.prata(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16, // Adjust font size as needed
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
