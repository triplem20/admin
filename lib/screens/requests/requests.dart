import 'package:admin/consts/consts.dart';
import 'package:admin/widgets/request_listtile.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/custom_drawer.dart';
import 'package:admin/widgets/custom_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../blocs/blocs.dart';
import 'package:admin/config/responsive.dart';

import '../../widgets/filter_listtile.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Requests',
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: '',
        widgets: [
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Container(
            constraints: const BoxConstraints(
              minHeight: 300,
              maxHeight: 1000,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: _buildRequests(context),
                ),],
            ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRequests(context),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildRequests(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .onSecondary,
          borderRadius: BorderRadius.circular(15.0)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.greenAccent,
            ),

            child: Row(
              children: [
                const SizedBox(width: 10),
                Text('Sort By',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildFilters(context);
                      },
                    );
                  }, icon:Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
          const SizedBox(height:20),
          BlocBuilder<RequestBloc, RequestState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                );
              }
              if (state is RequestLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                    index < state.requests.length;
                    index++,)
                      RequestListTile(
                        request: state.requests[index],
                        onTap: () {},
                        key: ValueKey(state.requests[index].id),

                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<RequestBloc>().add(
                      SortRequests(
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

  Dialog _buildFilters(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        width: 500,
        padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .onSecondary,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          const SizedBox(height: 20),
          Text('Status',
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall!,
          ),

          const SizedBox(height: 5),
          BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              if (state is FilterLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                );
              }
              if (state is FilterLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                    index < state.filters.length;
                    index++,)
                      FilterListTile(
                        filter: state.filters[index],
                        onTap: () {
                          context.read<FilterBloc>().add(
                            SelectFilter(state.filters[index]),
                          );
                        },
                        key: ValueKey(state.filters[index].id),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<FilterBloc>().add(
                      SortFilters(
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
          const SizedBox(height: 5),
          Text('Date',
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall!,
          ),

          const SizedBox(height: 100),
          Center(
            child: ElevatedButton(
              child: Text(" Ok "),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
              ),
            ),
          ),
          ],
      ),
      ),
    );
  }
}
