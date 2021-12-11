import 'video_type.dart';

class Video{
     VideoType large;
     VideoType medium;
     VideoType small;
     VideoType tiny;

     Video({
       required this.large,required this.medium,required this.small, required this.tiny
     });
      factory Video.fromJson(Map json){

        return Video(large: json['large'], medium: json['medium'], small: json['small'], tiny: json['tiny']);
      }

}