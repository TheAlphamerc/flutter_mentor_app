import 'package:flutter/material.dart';
import 'package:flutter_mentor_app/helper/color.dart';
import 'package:flutter_mentor_app/helper/constants.dart';
import 'package:flutter_mentor_app/helper/m_fonts.dart';
import 'package:flutter_mentor_app/model/mentor_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, this.model}) : super(key: key);
  final MentorModel model;
  Widget _appBar(context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(MIcons.keyboard_arrow_left),),
        Spacer(),
        Icon(MIcons.heart_24),
      ],
    );
  }

  Widget _cards(
    context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(model.image))),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: MColor.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(MIcons.star_fill_16,
                            color: MColor.yellow, size: 15),
                        SizedBox(height: 5),
                        Text("${model.ratings}/hr",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            )),
                      ],
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Reviews", style: GoogleFonts.inter(fontSize: 8)),
                        SizedBox(height: 8),
                        Text("1500",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Colors.black54)),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.name,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  SizedBox(height: 5),
                  Text(model.type,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Colors.black54)),
                ],
              ),
              Spacer(),
              Text("\$${model.price}/hr",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: MColor.green)),
            ],
          ),
          SizedBox(height: 20),
          Text("About ${model.name.split(" ")[0]}",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 15, height: 1.3)),
          SizedBox(height: 5),
          Text(Constants.description,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  color: Colors.black54)),
        ]);
  }

  Widget _achivment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Achievments",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600, fontSize: 15, height: 1.3)),
        SizedBox(height: 16),
        _achivmentCard(),
        SizedBox(height: 16),
        _achivmentCard(),
        SizedBox(height: 16),
        _achivmentCard(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _achivmentCard() {
    return Container(
       padding: EdgeInsets.symmetric(vertical:12,horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MColor.grey.withOpacity(.1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:Container(
          width:40,
          alignment:Alignment.center,
          child: Icon(MIcons.star_fill_16, color:MColor.yellow)
        ),
        title: Text("Supported 100+ startups",
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15)),
        subtitle: Text(Constants.description.substring(0, 90),
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _appBar(context),
                _cards(context),
                SizedBox(height: 20),
                _description(),
                SizedBox(height: 20),
                _achivment()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
