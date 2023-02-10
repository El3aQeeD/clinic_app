import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  List spe = ["Dermatologists","Cardiologists","Endocrinologists","Gastroenterologists","Internists","Neurologists"];

  Widget appBar(){
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: MyColors.navyBlue
        ),

        child:  const ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.white,
            radius: 30,
            child:  Icon(Icons.account_circle,size:55,),
          ) ,
          title: Text("Welcome back",style: TextStyle(fontSize: 18,color: Colors.grey ),),
          subtitle: Text("3aQeedo",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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

  Widget doctorsGrid(){
    return GridView.builder(
        itemCount: spe.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,childAspectRatio: 100 / 110 ),
        itemBuilder: (context,i){
          return  InkWell(onTap: (){
            //Navigator.of(context).push(MaterialPageRoute(builder: (context){}));
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
                    child: Image.asset("images/doctorLogo.jpg",alignment: Alignment.center,),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Khaled Mostafa"),

                  SizedBox(height: 5,),

                  const Text("3algniiii",style: TextStyle(color: Colors.white,fontSize: 12),),
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
    return Scaffold(
      body: SafeArea(

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
                      doctorsGrid(),


                  ],
                ),
              ),
            ),
          ),


    );
  }
}
