import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_one_habibi/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final albumState = ref.watch(albumApiStateNotifierProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('State Notifier Riverpod'),
//       ),
//       body: Builder(
//         builder: (context) {
//           if (albumState is AlbumInitialState) {
//             return const AlbumInitialWidget();
//           } else if (albumState is AlbumLoadingState) {
//             return const AlbumLoadingWidget();
//           } else if (albumState is AlbumLoadedState) {
//             return AlbumLoadedWidget(albums: albumState.albums);
//           } else {
//             return AlbumErrorWidget(
//                 error: (albumState as AlbumErrorState).error);
//           }
//         },
//       ),
//     );
//   }
// }

// class AlbumInitialWidget extends ConsumerWidget {
//   const AlbumInitialWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Text('Click Fetch Button to Load data'),
//           ElevatedButton(
//               onPressed: () {
//                 ref.read(albumApiStateNotifierProvider.notifier).fetchAlbums();
//               },
//               child: const Text('Fetch Albums')),
//         ],
//       ),
//     );
//   }
// }

// class AlbumLoadingWidget extends ConsumerWidget {
//   const AlbumLoadingWidget({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }

// class AlbumLoadedWidget extends ConsumerWidget {
//   const AlbumLoadedWidget({required this.albums, super.key});
//   final List<Album> albums;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ListView.builder(
//       itemCount: albums.length,
//       itemBuilder: (context, index) => ListTile(
//         leading: CircleAvatar(
//           child: Text(albums[index].id.toString()),
//         ),
//         title: Text(albums[index].title),
//       ),
//     );
//   }
// }

// class AlbumErrorWidget extends ConsumerWidget {
//   const AlbumErrorWidget({required this.error, super.key});
//   final String error;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: Text(error),
//       ),
//     );
//   }
// }
// class MyHomePage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var counter = ref.watch(counterStateNotifier);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Riverpod'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             const Text('The value of Counter :'),
//             Text(counter.toString()),
//             ElevatedButton(
//                 onPressed: () {
//                   ref.read(counterStateNotifier.notifier).increment();
//                 },
//                 child: const Text('Increment')),
//             ElevatedButton(onPressed: () {
//               ref.read(counterStateNotifier.notifier).decrement();
//             }, child: const Text('Decrement'))
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    )),
                child: const Text('Go To Counter'))
          ],
        ),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            // Consumer(
            //   builder: (context, ref, child) {
            //     final counter = ref.watch(counterProvider);
            //     return Text('Counter : $counter');
            //   },
            // ),
            CounterText(),
            CounterElevatedButton(
                counterOperationType: CounterOperationType.increament,
                child: Text('Increment')),
            CounterElevatedButton(
                counterOperationType: CounterOperationType.decrement,
                child: Text('Decrement')),
          ],
        ),
      ),
    );
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Text('Counter : $counter');
  }
}

class CounterElevatedButton extends ConsumerWidget {
  const CounterElevatedButton(
      {required this.counterOperationType, required this.child, super.key});
  final Widget child;
  final CounterOperationType counterOperationType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          if (counterOperationType == CounterOperationType.increament) {
            ref.read(counterProvider.notifier).state += 1;
          } else {
            ref.read(counterProvider.notifier).state -= 1;
          }
        },
        child: child);
  }
}

enum CounterOperationType { increament, decrement }
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final country = ref.read(counteryProvider);
//     final city = ref.read(cityProvider);
//     return Center(
//       child: Column(children: [
//         Text(country),
//         Text(city),
//       ],),
//     );
//   }
// }
