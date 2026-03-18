import '../../dummy_data.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _history = fakeRidePrefs;

  @override
  Future<List<RidePreference>> getHistory() async {
    return _history;
  }

  @override
  Future<void> savePreference(RidePreference preference) async {
    _history.add(preference);
  }
}