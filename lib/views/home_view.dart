import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/bloc/home_cubit/home_logic.dart';
import 'package:clinic_app/bloc/home_cubit/home_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/repositories/home_data_repo/home_data_api.dart';
import 'package:clinic_app/views/doctor_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {

  final List spe = ["Dermatologists","Cardiologists","Endocrinologists","Gastroenterologists","Internists","Neurologists"];

  Home({super.key});

  Widget appBar(){
    return  Padding(
      padding:const  EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: MyColors.navyBlue
        ),

        child:   ListTile(
          leading: const CircleAvatar(
            foregroundColor: Colors.white,
            radius: 30,
            child:  Icon(Icons.account_circle,size:55,),
          ) ,
          title: const  Text("Welcome back",style: TextStyle(fontSize: 18,color: Colors.grey ),),
          subtitle: Text(sharedPref.get('userName').toString(),style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

  Widget doctorSpecialties(){
    return SizedBox(
      height: 50,
      child: ListView.builder(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount:spe.length ,
          itemBuilder:(context,i){
            return Row(
              children: [
                Container(

                  decoration:const  BoxDecoration(
                    color: MyColors.darkBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(child: Text(spe[i],style:const TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 1)),
                      )
                  ),
                ),

                const SizedBox(width: 10,)
              ],
            );
          } ),
    );
  }

  Widget doctorsGrid(HomeCubit obj){
    return GridView.builder(
        itemCount: obj.response.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,childAspectRatio: 100 / 110 ),
        itemBuilder: (context,i){
          return  InkWell(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorProfile(doctor_id: '${obj.response[i].doctorId}',)));
            print(obj.response[i].doctorId);
          },
            child: Container(

              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: MyColors.darkBlue
              ),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    child: Image.network("$linkPhotosFolders/${obj.response[i].doctorImage}",alignment: Alignment.center,),
                  ),
                  const SizedBox(height: 10,),
                  Text("${obj.response[i].doctorName}"),

                  const SizedBox(height: 5,),

                  Text("${obj.response[i].doctorAbout}",style:const  TextStyle(color: Colors.white,fontSize: 12),),
                  const SizedBox(height: 5,),
                  const Text("book now",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),

                ],
              ),

            ),
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    var obj = HomeCubit(homeDataRepository: HomeDataApi()).getObj(context);
    obj.checkHomeState();

    return BlocConsumer<HomeCubit,HomeState>(
      listener:(context,state){
        if (state is HomeLoading)
        {
          print("home loading");
        }
        else if (state is HomeSuccess)
        {
          print("home success");
        }
        else if (state is HomeFailure)
        {
          print("home fail");
        }
        else
        {
          print("error in bloc");
        }

      },
      builder:(context,state)=> Scaffold(
        body: obj.noInternet == true ? Center(child: Image.asset("images/noConnection.jpg"),):
        obj.isLoading == true ? const Center(child: CircularProgressIndicator(),) :
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height:  MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                children:  [
                  appBar(),
                  const SizedBox(height: 20,),
                  const Text("Specialties" , style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  doctorSpecialties(),
                  const SizedBox(height: 20,),
                  const Text("Doctors profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,)),
                  const SizedBox(height: 20,),
                  doctorsGrid(obj),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
