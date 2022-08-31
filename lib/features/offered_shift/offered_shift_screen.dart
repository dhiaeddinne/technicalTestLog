import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_logient/domain/repositories/offered_shifts_repository.dart';
import 'package:technical_test_logient/features/offered_shift/bloc/offered_shift_bloc.dart';
import 'package:technical_test_logient/features/offered_shift/bloc/offered_shift_events.dart';
import 'package:technical_test_logient/features/offered_shift/bloc/offered_shift_states.dart';
import 'package:technical_test_logient/features/shift_details/shift_details_screen.dart';
import 'package:technical_test_logient/widgets/card_widget.dart';
import 'package:technical_test_logient/widgets/custom_navigation/slide_left_route.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;

class ShiftOffertScreen extends StatefulWidget {
  @override
  _ShiftOffertScreenState createState() => _ShiftOffertScreenState();
}

class _ShiftOffertScreenState extends State<ShiftOffertScreen> {
  OfferedShiftsRepositories offeredShiftsRepositories =
      OfferedShiftsRepositories();
  OfferedShiftsBloc offeredShiftsBloc = OfferedShiftsBloc();
  final DateFormat formatter = DateFormat.MMMMEEEEd();

  @override
  void initState() {
    super.initState();
    offeredShiftsBloc.add(LoadOfferedShift());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: offeredShiftsBloc,
      builder: (context, state) {
        if (state is OfferedShiftLoadingState) {
          return Scaffold(
            backgroundColor: colors.lightGrey,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SpinKitDoubleBounce(
                color: colors.lightGreen,
                size: 50.0,
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: colors.lightGrey,
          body: BlocBuilder(
            bloc: offeredShiftsBloc,
            builder: (context, state) {
              if (state is OfferedShiftsLoadedSuccessfully) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Shifts offerts",
                          size: 30,
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: GroupListView(
                            sectionsCount: state.shifts.keys.toList().length,
                            countOfItemInSection: (int section) {
                              return state.shifts.values.toList()[section].length;
                            },
                            itemBuilder: (BuildContext context, IndexPath index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(SlideLeftRoute(
                                        page: ShiftDetailsScreen(
                                          shiftDetails: state.shifts.values.toList()[index.section][index.index],
                                        )));
                                  },
                                  child: ShiftCard(
                                    company: state.shifts.values.toList()[index.section][index.index].company!,
                                    status: formatter.format(DateTime.now()) ==
                                        formatter.format(DateTime.parse(
                                            state.shifts.values.toList()[index.section][index.index].startAt.toString()))
                                        ? "Aujourd'hui"
                                        :  formatter.format(DateTime.parse(
                                        state.shifts.values.toList()[index.section][index.index].startAt.toString())),
                                    postName: state.shifts.values.toList()[index.section][index.index].postName!,
                                    bonusPrice: state.shifts.values.toList()[index.section][index.index].bonus.toString(),
                                    buyPrice:state.shifts.values.toList()[index.section][index.index].buyPrice.toString(),
                                    startAt: state.shifts.values.toList()[index.section][index.index].startAt!,
                                    endAt: state.shifts.values.toList()[index.section][index.index].endAt!,
                                  ),
                                ),
                              );
                            },
                            groupHeaderBuilder: (BuildContext context, int section) {
                              return state.shifts.values.toList()[section].isEmpty ? Container():Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: state.shifts.keys.toList()[section],
                                    color: colors.grey,
                                    size: 14,
                                    weight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  // Text(
                                  //   state.shifts.keys.toList()[section],
                                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  // ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 10),
                            sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
                          ),
                        ),
                      ],
                    ),
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
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: colors.lightGreen,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                CustomText(
                                  text: "Shift Offerts",
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: colors.lightGrey,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.file_copy),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: colors.lightGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
