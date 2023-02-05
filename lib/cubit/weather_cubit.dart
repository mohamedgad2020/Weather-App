import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubit/weather_state.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  String? cityName;
  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityNname}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityNname);
      emit(WeatherSuccess(weatherModel: weatherModel));
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
