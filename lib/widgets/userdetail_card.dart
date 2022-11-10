import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget userInfo(
    double width, String image, String name, String email, String movie) {
  return (Container(
    width: width,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white60,
      border: Border.all(
        color: Colors.black26,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey, //New
          blurRadius: 15.0,
          spreadRadius: 1.0,
          offset: Offset(
            1,
            1,
          ),
        ),
      ],
    ),
    // color: Colors.red,
    child: Wrap(
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
            // color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 5.0, right: 5.0, bottom: 0.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    image,
                    scale: 10.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.sacramento(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepOrange,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        wordSpacing: 0.0,
                      ),
                    ),
                    Text(
                      "Fav Genre: $movie",
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        wordSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}
