import 'package:flutter/material.dart';
import 'package:admin/widgets/custom_drawer.dart';
import 'package:admin/widgets/custom_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:admin/config/responsive.dart';

import '../../blocs/request/request_bloc.dart';
import '../../widgets/request_listtile.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Users',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      drawer: const CustomDrawer(),
      body: CustomLayout(title: '',
          widgets:
          [
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
          ? Container(
          constraints: const BoxConstraints(
            minHeight: 300,
            maxHeight: 1000,
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildRequests(context),
              ),

            ],
          ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildRequests(context),
            ],
          ),
          ],
      ),
    );
  }
  Container _buildRequests(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(15.0)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),
          BlocBuilder<RequestBloc, RequestState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
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
                        onTap: () {
                        },
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
}
