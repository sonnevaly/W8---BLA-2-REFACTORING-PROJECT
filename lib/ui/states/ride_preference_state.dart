import 'package:flutter/material.dart';
import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _history = [];

  RidePreferenceState({required this.repository}) {
    _loadHistory();
  }

  // Getters
  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get history => _history;

  // Load history from repository
  Future<void> _loadHistory() async {
    _history = await repository.getHistory();
    notifyListeners();
  }

  // Select a preference
  Future<void> selectPreference(RidePreference preference) async {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      await repository.savePreference(preference);
      _history = await repository.getHistory();
      notifyListeners(); 
    }
  }
}