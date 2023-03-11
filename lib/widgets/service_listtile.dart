import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/services/service_bloc.dart';

class ServiceListTile extends StatelessWidget {
  const ServiceListTile({
    Key? key,
    required this.service,
    required this.onTap,
  }) : super(key: key);

  final Service service;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          service.imageUrl,
        ),
      ),
      title: Text(
        service.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        service.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: IconButton(onPressed: (){
          showDialog(
    context: context,
    builder: (BuildContext context)
          {
            return _showDialog(context);
          }); },
    icon: Icon(Icons.delete)),
      ),

        );
  }


      Dialog _showDialog(BuildContext context) {
        // set up the buttons

        // set up the AlertDialog
        return Dialog(
            child: Container(
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 7),
                    Text(" Are You Sure ?",
                      style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    const SizedBox(height: 50),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(" Yes "),
                            onPressed: () {
                              BlocProvider.of<ServiceBloc>(context).add(
                                RemoveService(service: service),
                              );
                              Navigator.pop(context);
                            },

                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.greenAccent),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            child: Text("Cancel",
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.onSecondary,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ));
      }
}
