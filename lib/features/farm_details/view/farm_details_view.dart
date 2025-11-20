
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/models/farm_details_model.dart';
import 'package:relaxio/core/theme/app_colors.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_cubit.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_states.dart';
import 'package:relaxio/features/farm_details/view_model/farm_details_cubit.dart';
import 'package:relaxio/features/farm_details/view_model/farm_details_states.dart';
import 'package:relaxio/generated/l10n.dart';
part '../widget/farm_image_widget.dart';
part '../widget/farm_owner_card_widget.dart';
part '../widget/farm_name_and_city_wigdet.dart';
part '../widget/farm_features_widget.dart';
part '../widget/farm_available_package_widget.dart';
part '../widget/farm_description.dart';

class FarmDetailsView extends StatelessWidget {
  const FarmDetailsView({
    super.key,
    required this.farmId,
  });
  final int farmId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FarmDetailsCubit()..getFarmDetails(farmId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<FarmDetailsCubit, FarmDetailsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final farmDetailsCubit = context.read<FarmDetailsCubit>();
            final farm = farmDetailsCubit.farm;

            if (state is FarmDetailsLoadingState) {
              return const Center(child: CustomLoadingDialog());
            }

            if (state is FarmDetailsErrorState) {
              return Center(child: Text(state.error));
            }

            if (farm == null) {
              return const Center(child: Text("No farm details available"));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FarmImageWidget(farm: farm, images: farm.images ?? []),
                  const SizedBox(height: 10),
                  Padding(
                    padding: AppPadding.allpadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FarmNameAndCityWigdet(farm: farm),
                        const SizedBox(height: 25),
                        FarmOwnerCardWidget(farm: farm),
                        const SizedBox(height: 25),
                        FarmFeaturesWidget(farm: farm),
                        const SizedBox(height: 25),
                        FarmAvailablePackageWidget(farm: farm),
                        const SizedBox(height: 25),
                        FarmDescription(farm: farm),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
