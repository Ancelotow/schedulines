import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/domain/notifications/StopSelectedNotification.dart';
import 'package:t_paris/ui/cubits/states/transport_stop_state.dart';
import 'package:t_paris/ui/cubits/transport_stop_cubit.dart';
import 'package:t_paris/ui/widgets/error.dart';
import 'package:t_paris/ui/widgets/transport_avaible_displayer.dart';

class LandingPageSearchfieldBloc extends StatelessWidget {
  final Stop? currentStop;

  const LandingPageSearchfieldBloc({
    Key? key,
    this.currentStop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportStopCubit>(context);
    viewModel.getAllStops();
    return BlocBuilder<TransportStopCubit, TransportStopState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TransportStopStateLoading:
            return const TextField(
              style: TextStyle(
                color: Colors.white,
              ),
            );
          case TransportStopStateError:
            return Center(child: WidgetError(exception: state.error!));
          case TransportStopStateSuccess:
            return _getAutocompleteField(context, state.data!);
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _getAutocompleteField(BuildContext context, List<Stop> stops) {
    return Autocomplete<Stop>(
      initialValue: TextEditingValue(text: currentStop?.name ?? ""),
      onSelected: (stop) {
        StopSelectedNotification(stop).dispatch(context);
      },
      displayStringForOption: (stop) => stop.name,
      fieldViewBuilder: (_, textEditiginController, focusNode, onSubmit) =>
          TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: "Saisissez votre station...",
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
          suffixIcon: IconButton(
            onPressed: textEditiginController.clear,
            icon: const Icon(
              Icons.clear_sharp,
              size: 13,
            ),
          ),
        ),
        controller: textEditiginController,
      ),
      optionsBuilder: (textEditingValue) {
        return stops
            .where(
              (e) => e.name
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()),
            )
            .take(5);
      },
      optionsViewBuilder: (context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onSelected.call(options.elementAt(index));
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "Roboto",
                            color: Colors.white,
                          ),
                          child: Text(
                            options.elementAt(index).name,
                          ),
                        ),
                        const SizedBox(width: 10),
                        TransportAvailableDisplayer(
                          stop: options.elementAt(index),
                          symbolColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
