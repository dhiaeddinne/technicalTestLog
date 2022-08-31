import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_logient/features/shift_details/bloc/reverse_geocoding_bloc.dart';
import 'package:technical_test_logient/features/shift_details/bloc/reverse_geocoding_events.dart';
import 'package:technical_test_logient/features/shift_details/bloc/reverse_geocoding_states.dart';
import 'package:technical_test_logient/models/shift.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/widgets/tag_widget.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;

class ShiftDetailsScreen extends StatefulWidget {
  Shift shiftDetails;

  ShiftDetailsScreen({required this.shiftDetails});

  @override
  _ShiftDetailsScreenState createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  final DateFormat formatter = DateFormat.Hm();
  ReverseGeoCodingBloc reverseGeoCodingBloc = ReverseGeoCodingBloc();
  final DateFormat formatterDate = DateFormat.MMMMEEEEd();

  @override
  void initState() {
    reverseGeoCodingBloc.add(ReverseLatLong(
        lat: widget.shiftDetails.latitude!,
        long: widget.shiftDetails.longitude!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder(
            bloc: reverseGeoCodingBloc,
            builder: (ctx, state) {
              if (state is AddressLoadedSuccessfully) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 5)),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            height: 120,
                            width: 120,
                            child: const CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                    AssetImage("assets/images/restaurant.jpg"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomText(
                          text: widget.shiftDetails.company!,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        height: formatterDate.format(DateTime.now()) ==
                            formatterDate.format(DateTime.parse(
                                widget.shiftDetails.startAt.toString()))
                            ? 25:0,
                      ),
                      formatterDate.format(DateTime.now()) ==
                          formatterDate.format(DateTime.parse(
                              widget.shiftDetails.startAt.toString()))
                          ? CustomText(
                              text: "Aujourd'hui".toUpperCase(),
                              color:
                                   colors.red,
                              size: 15,
                              weight: FontWeight.w500,
                            )
                          : Container(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TagWidget(
                                  content: widget.shiftDetails.postName!,
                                  color: colors.darkGrey),
                              const SizedBox(
                                width: 12,
                              ),
                              CustomText(
                                text:
                                    "${double.tryParse(widget.shiftDetails.buyPrice ?? "")?.toInt() ?? ""}\$ / H",
                                color: colors.darkGrey,
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Flexible(
                            child: CustomText(
                              text:
                                  "${formatter.format(DateTime.parse(widget.shiftDetails.startAt.toString()))} - ${formatter.format(DateTime.parse(widget.shiftDetails.endAt.toString()))}",
                              color: colors.darkGrey,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      itemDetails(
                          text: state.address, icon: Icons.location_on_outlined),
                      const SizedBox(
                        height: 20,
                      ),
                      itemDetails(
                          text: "Bonus au travailleur",
                          icon: Icons.monetization_on_outlined),
                      const SizedBox(
                        height: 20,
                      ),
                      itemDetails(text: "Pause de 30 minutes", icon: Icons.pause),
                      const SizedBox(
                        height: 20,
                      ),
                      itemDetails(
                          text: "Stationnement gratuit",
                          icon: Icons.local_parking),
                      const SizedBox(
                        height: 20,
                      ),
                      itemDetails(
                          text: "Pantalon noir, chemise noir",
                          icon: Icons.accessibility),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "RESPONSABLE",
                        color: colors.grey,
                        size: 14,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        text: "Greogie Kovlaks",
                        color: Colors.black,
                        size: 14,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: colors.lightGreen,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: CustomText(
                                  text: "Postuler",
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SpinKitDoubleBounce(
                  color: colors.lightGreen,
                  size: 50.0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget itemDetails({required String text, required IconData icon}) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5)),
            height: 30,
            width: 30,
            child: icon == Icons.monetization_on_outlined
                ? const Center(child: Text("\$"))
                : Icon(
                    icon,
                    size: 15,
                  )),
        const SizedBox(
          width: 10,
        ),
        CustomText(
          text: text,
          size: 18,
        )
      ],
    );
  }
}
