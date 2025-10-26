
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/models/farm_model.dart';
import 'package:relaxio/core/theme/app_colors.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/core/widgets/text_field/custom_text_field.dart';
import 'package:relaxio/features/farm_details/view/farm_details_view.dart';
import 'package:relaxio/features/home/view_model/home_cubit.dart';
import 'package:relaxio/features/home/view_model/home_states.dart';
part '../widget/farm_card_widget.dart';
part '../widget/home_search_widget.dart';
part '../widget/home_empty_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllFarms(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              final farm = context.read<HomeCubit>();

              return Padding(
                padding: AppPadding.allpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const _HomeSearchWidget(),
                    const SizedBox(height: 40),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                    const Text(
                      'All Offers',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: farm.farms.isEmpty
                          ? const CustomLoadingDialog()
                          : farm.searchController.text.isNotEmpty &&
                                  farm.farmsSearch.isEmpty
                              ? const _EmptyFarmsWidget()
                              : ListView.builder(
                                  itemCount: farm.searchController.text.isEmpty
                                      ? farm.farms.length
                                      : farm.farmsSearch.length,
                                  itemBuilder: (context, index) {
                                    final farmsList =
                                        farm.searchController.text.isEmpty
                                            ? farm.farms
                                            : farm.farmsSearch;
                                    return FarmCardWidget(
                                        farm: farmsList[index]!);
                                  },
                                ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
