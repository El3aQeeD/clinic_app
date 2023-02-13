import 'package:clinic_app/bloc/home_cubit/home_state.dart';
import 'package:clinic_app/models/home_data.dart';
import 'package:clinic_app/repositories/home_data_repo/home_data_api.dart';
import 'package:clinic_app/repositories/home_data_repo/home_data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{

  HomeDataRepository? homeDataRepository;
  HomeCubit({this.homeDataRepository}):super(HomeInitial());
  late List<HomeData> response;
  bool isLoading=false;
  bool noInternet = false;


   HomeCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkHomeState()async {

    emit(HomeLoading());

    isLoading = true;

    response = await HomeDataApi().getHomeData();


    if(response.isNotEmpty){


      emit(HomeSuccess());
      noInternet=false;
      isLoading=false;

    }
    else
    {

      emit(HomeFailure());
      noInternet = true;
      isLoading=false;
    }


  }
}

