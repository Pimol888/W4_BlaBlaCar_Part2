import '../model/ride/locations.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../repository/mock/mock_rides_repo.dart';
import '../service/rides_service.dart';
import '../utils/date_time_util.dart';

void main(){


  ///
  /// o	Initialize the RidesServices service with the MockRidesRepository
  ///
  RidesService.initialize(MockRidesRepository()); 

  RidePreference ridePreference1 = RidePreference(
    departure: Location(name: "Battambang", country: Country.cambodia),
    departureDate: DateTime.now(), 
    arrival: Location(name: "Siem Reap", country: Country.cambodia), 
    requestedSeats: 1
    );

  // this is user filter
  RidesFilter filter = RidesFilter(false);
  RideSortType sortBy = RideSortType.timeOfDeparture;

  List<Ride> matchRide = RidesService.instance!.getRidesFor(ridePreference1, filter, sortBy);
  String departureDate = DateTimeUtils.formatDateTime(ridePreference1.departureDate);

  print("For your preference (${ridePreference1.departure.name} -› ${ridePreference1.arrival.name}, $departureDate ${ridePreference1.requestedSeats} passenger)\nwe founded 4 rides:");
  for(var ride in matchRide){
    String rideIsFull = ride.availableSeats == 0 ? "Ride is full" : " ";
    print(" at ${ride.departureDate.hour}:${ride.departureDate.minute}\t with ${ride.driver.firstName} (hours : ${ride.arrivalDateTime.difference(ride.departureDate).inHours} hours) $rideIsFull");
  }

}
