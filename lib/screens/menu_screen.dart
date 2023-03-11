
import 'package:admin/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add_Product_card.dart';
import '../widgets/add_Service_card.dart';
import '../widgets/product_listtile.dart';
import '/config/responsive.dart';
import 'package:velocity_x/velocity_x.dart';
import '/widgets/widgets.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body:CustomLayout(
        title: 'Menu',
        widgets: [

          _buildServiceCarousel(),
          const SizedBox(height: 10),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Container(
            constraints: const BoxConstraints(
              minHeight: 300,
              maxHeight: 800,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildCategories(context),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildServices(context),
                ),
                const SizedBox(width: 20),

              ],
            ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategories(context),
              const SizedBox(height: 20),
              _buildServices(context),
              const SizedBox(height: 20),

            ],
          ),
        ],
      ),
    );
  }

  BlocBuilder<ServiceBloc, ServiceState> _buildServiceCarousel() {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        if (state is ServiceLoaded) {
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
              child:VxSwiper.builder(
                height: 150,
                autoPlay: true,
                itemCount: state.services.length,
                itemBuilder: (context,index){
                  return
                    ServiceCard(
                    service: state.services[index], index: 1,
                  );
                },
              ),
            ),
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }

  Container _buildServices(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(15.0)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          const AddServiceCard(),
          const SizedBox(height: 5),
          BlocBuilder<ServiceBloc, ServiceState>(
            builder: (context, state) {
              if (state is ServiceLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                );
              }
              if (state is ServiceLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [ 
                    for (int index = 4; index < state.services.length; index++,)
                      ServiceListTile(
                        service: state.services[index],
                        key: ValueKey(
                          state.services[index].id,
                        ), onTap: () {  },
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<ServiceBloc>().add(
                      SortServices(
                        oldIndex: oldIndex,
                        newIndex: newIndex,
                      ),
                    );
                  },
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }


  Container _buildCategories(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                    index < state.categories.length;
                    index++,)
                      CategoryListTile(
                        category: state.categories[index],
                        onTap: () {
                          context.read<CategoryBloc>().add(
                            SelectCategory(state.categories[index]),
                          );
                        },
                        key: ValueKey(state.categories[index].id),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<CategoryBloc>().add(
                      SortCategories(
                        oldIndex: oldIndex,
                        newIndex: newIndex,
                      ),
                    );
                  },
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}




