import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skiddo_web/logic/works/work_provider.dart';
import 'package:skiddo_web/models/images/folder_image.dart';

class SampleConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final state = ref.watch(sampleNotifierProvider);

    return state.when(
      initial: () => JokeCard(),
      loading: () => Center(child: CircularProgressIndicator()),
      data: (joke) => JokeCard(),
      error: (error) => Text('Error Occured!'),
    );
  }
}




class JokeCard extends ConsumerWidget {
  const JokeCard({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextButton(onPressed: () {
                ref.read (sampleNotifierProvider.notifier).getWorks({});

              }, child: Text("data")),
              Text(
                "sample.imageId" ,
                style: theme.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
              "  sample.imageId" ,
                style: theme.textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Icon(
                 Icons.remove,
                color:   Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}