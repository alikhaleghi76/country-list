import 'package:country_list/core/multi_lang/app_local.dart';
import 'package:country_list/feature/country_list/presentation/cubit/country/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountryCubit>(context).loadCountries();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.of(context).getTranslate("country_list")),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state is CountryStateLoading) {
            return SkeletonListView();
          } else if (state is CountryStateSuccess) {
            return OrientationBuilder(
              builder: (context, orientation) {
                return GridView.builder(
                  itemCount: state.countryList.length,
                  itemBuilder: (context, index) {
                    final country = state.countryList[index];
                    return ListTile(
                      leading: SizedBox(
                        width: 70,
                        child: SvgPicture.network(
                          country.flag,
                          placeholderBuilder: (context) {
                            return const SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                              width: 70,
                            ));
                          },
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title:
                          Text(Localizations.localeOf(context).languageCode == 'fa' ? country.translations.fa : country.name),
                      subtitle: Text(country.capital),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.landscape ? 2 : 1, mainAxisExtent: 70),
                );
              },
            );
          } else if (state is CountryStateFailure) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _reload(context);
                      },
                      child: Text(AppLocal.of(context).getTranslate("reload")),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _reload(BuildContext context) {
    BlocProvider.of<CountryCubit>(context).loadCountries();
  }
}
