import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/location/location_repository.dart';
import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/states/ride_preference_state.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const BlaBlaApp());
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositories
        Provider<LocationRepository>(
          create: (_) => LocationRepositoryMock(),
        ),
        Provider<RideRepository>(
          create: (_) => RideRepositoryMock(),
        ),
        Provider<RidePreferenceRepository>(
          create: (_) => RidePreferenceRepositoryMock(),
        ),
        // Global State
        ChangeNotifierProvider<RidePreferenceState>(
          create: (context) => RidePreferenceState(
            repository: context.read<RidePreferenceRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: blaTheme,
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}