import 'package:flutter/material.dart';

import '../models/TrainSeat.dart';

class SeatFinderScreen extends StatefulWidget {
  const SeatFinderScreen({Key? key}) : super(key: key);

  @override
  State<SeatFinderScreen> createState() => _SeatFinderScreenState();
}

class _SeatFinderScreenState extends State<SeatFinderScreen> {
  final _seatNoController= TextEditingController();
  bool isSearching = false;
  final _controller= new ScrollController();

  List<TrainSeat> allSeats=[
    TrainSeat(seatNo: 1, seatClass: "Lower"),
    TrainSeat(seatNo: 2, seatClass: "Middle"),
    TrainSeat(seatNo: 3, seatClass: "Upper"),
    TrainSeat(seatNo: 4, seatClass: "Upper"),
    TrainSeat(seatNo: 5, seatClass: "Upper"),
    TrainSeat(seatNo: 6, seatClass: "Upper"),
    TrainSeat(seatNo: 7, seatClass: "Upper"),
  ];
  List _isSelectedIndexes=[];
  int sI=1;

  @override
  void initState(){
    super.initState();
    _seatNoController.addListener(() {
      this.setState(() {


      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
     return   SafeArea(
      child: Scaffold(
        body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 50),
                child: Text("Seat Finder",
                  style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.lightBlueAccent),),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child:
                textField(),
              ),
      SizedBox(
          height: 20,
      ),
      berthBed(),
            ],
          ),
        
      ),
    );
  }

  TextField textField() {
    return
      TextField(
              style: TextStyle(color: Colors.lightBlueAccent),
              controller: _seatNoController,
              decoration: InputDecoration(
                hintText: "Enter Seat Number...",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                    borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2.7)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                    borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2.7)
                ),
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _seatNoController.text.isNotEmpty? Color(0xff80cbff):Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                    onPressed: (){
                    allSeats.map((e)  {
                      var index = allSeats.indexOf(e);
                    setState(() {
                      if (_seatNoController.text == allSeats[index].seatNo.toString()) {

                      _isSelectedIndexes.add(index);
                      }else{
                        _isSelectedIndexes.remove(index);
                      }
                    });
                    }).toList();






                    },

                    child: Text("Find"))
              ),


    );
  }
  berthBed() {
    return
       Expanded(
         child:ListView.builder(
                 itemCount: 4,
                          shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              final _isSelected=_isSelectedIndexes.contains(index);
                              return  Container(
                                height: 200,
                                child: Stack(
                                    children: [
                                          Positioned(
                                            bottom: 136,
                                            child: Row(
                                                children: [
                                                  customSeatWidget(3,false,_isSelected),
                                                  SizedBox(width: 50,),

                                                  customSeatWidget(1,false,_isSelected),
                                                ],

                                      ),
                                          ),
                                               Positioned(
                                                 top: 130,
                                                 child: Row(
                                                    children: [
                                                       customSeatWidget(3,true,_isSelected),
                                                      SizedBox(width: 50,),

                                                      customSeatWidget(1,true,_isSelected),
                                                    ],
                                             ),
                                               ),
                                    ],

                                ),
                              );
                            }


         )
       );


  }
  customSeatWidget(int numberSeats,bool isReverted, _isSelected){

    return
      numberSeats==3 && isReverted==false ?
                Container( //changes
                height: 84,
                width: 273,
                child: CustomPaint(
                    painter: RoundedRectanglePainter(),
                        child: Stack(
                            children:[
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context,index){
                                var seat = allSeats[index];
                                return
                                  Container(
                         height: 48,
                         width: 51,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(2),
                          color: _isSelected?Color(0xff0096ff):Color(0xffceeaff)
                      ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("${sI++}",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                      Text(seat.seatClass,style: TextStyle(color: Color(0xff3682d4)),)
                      ],
                      ),
                                 );
                // Positioned(
                // top: 35,
                // left: 77,
                // child: Container(
                // height: 48,
                // width: 51,
                // decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(2),
                // color: Color(0xffceeaff)
                // ),
                // child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // children: [
                // Text(seat.seatNo.toString(),style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                // Text(seat.seatClass,style: TextStyle(color: Color(0xff3682d4)),)
                // ],
                // ),
                // ),
                // ),
                // Positioned(
                // top: 35,
                // left: 135,
                // child: Container(
                // height: 48,
                // width: 51,
                // decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(2),
                // color: Color(0xffceeaff)
                // ),
                // child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // children: [
                // Text("6",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                // Text("Lower",style: TextStyle(color: Color(0xff3682d4)),)
                // ],
                // ),
                // ),
                // )

                }
                        ),
                            )
                    ]


                        ),

                    )




     ):
   numberSeats==3 && isReverted==true?
    Container(  //true
       height: 84,
       width: 273,
       child: CustomPaint(
             painter: RoundedRectanglePainter(),
             child: Stack(
               clipBehavior: Clip.none,
               children:[
                 Positioned(
                   top: 4,
                   left: 23,
                   child: Container(
                     height: 52,
                     width: 57,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(2),
                         color: Color(0xffceeaff)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("1",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                         Text("Lower",style: TextStyle(color: Color(0xff3682d4)),)
                       ],
                     ),
                   ),
                 ),
                 Positioned(
                   top: 4,
                   left: 81,
                   child: Container(
                     height: 52,
                     width: 57,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(2),
                         color: Color(0xffceeaff)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("1",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                         Text("Lower",style: TextStyle(color: Color(0xff3682d4)),)
                       ],
                     ),
                   ),
                 ),
                 Positioned(
                   top: 4,
                   left: 139,
                   child: Container(
                     height: 52,
                     width: 57,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(2),
                         color: Color(0xffceeaff)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("1",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                         Text("Lower",style: TextStyle(color: Color(0xff3682d4)),)
                       ],
                     ),
                   ),
                 ),


               ],
             )

       ),

     ) :
       numberSeats==1 && isReverted==false?
   Container(
       height: 84,
       width: 108,
       child: CustomPaint(
             painter: RoundedRectanglePainter(),
             child: Stack(
               clipBehavior: Clip.none,
               children:[

                 Positioned(
                   top: 35,
                   left: 22,
                   child: Container(
                     height: 48,
                     width: 55,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(2),
                         color: Color(0xffceeaff)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("1",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                         Text("Upper",style: TextStyle(color: Color(0xff3682d4)),)
                       ],
                     ),
                   ),
                 ),

               ],
             )

       ),
     ):
       Container(
           height: 84,
           width: 108,
           child: CustomPaint(
               painter: RoundedRectanglePainter(),
               child: Stack(
                 clipBehavior: Clip.none,
                 children:[
                   Positioned(
                     top: 5,
                     left: 22,
                     child: Container(
                       height: 48,
                       width: 55,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(2),
                           color: Color(0xffceeaff)
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("1",style: TextStyle(color: Color(0xff2675cd),fontSize: 22),),
                           Text("Upper",style: TextStyle(color: Color(0xff3682d4)),)
                         ],
                       ),
                     ),
                   ),
                 ],
               )

           ),


    );





  }


}




class RectanglePainter  extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint()
   ..color=Colors.red
    ..strokeWidth=5
    ..style=PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint=Paint()
    ..color=Color(0xff80CBFF)
    ..strokeWidth=10
    ..style=PaintingStyle.fill;
    final a=Offset(15, size.height* 1/4);
    final b=Offset(size.width * 3/4, size.height* 3/4);

    final rect =Rect.fromPoints(a, b);
    final radius = Radius.circular(6);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius),paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
    false;

}
