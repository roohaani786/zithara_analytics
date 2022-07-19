import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'zi_container.dart';

Widget ziBox({String? label, String? specifiedAsset, double? height, double? width}){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Neumorphic(
      style: NeumorphicStyle(
        shadowLightColor: Colors.green.shade200
      ),
      child: ZiContainer(
        height: height == null? 120.0:height,
          width: width == null? 120:width,
          shadowColor: Colors.grey,
          borderColor: Colors.grey.shade200,
          padding: 10.0,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(specifiedAsset == null? "assets/svgs/log_screen.svg":specifiedAsset,
          color: Colors.green.shade800,
          height: 50.0,),
        //  Icon(Icons.info,color: Colors.green,size: 30,),
          Text(label == null?"Log Screen":label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54,fontSize: 12.5),),

        ],)),
    ),
  );
}