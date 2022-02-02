import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HeaderComponent extends StatefulWidget implements PreferredSizeWidget {
  final Text? title;
  final bool? center;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  HeaderComponent({Key? key, this.title, this.center}) : super(key: key);
  @override
  _HeaderComponentState createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  var appLogoInfo;

  @override


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.3),
      centerTitle: widget.center ?? true,
      title: appLogoInfo != null
          ? CachedNetworkImage(
        height: 45,
        fit: BoxFit.contain,
        imageUrl: appLogoInfo['siteLogo']['img_url'],
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(
              child:
              LinearProgressIndicator(value: downloadProgress.progress),
            ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/logo.png',
          height: 45,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      )
          : Image.asset('assets/images/logo.png', height: 45),
      iconTheme: const IconThemeData(color: Colors.black87),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: ElevatedButton(
      //       onPressed: () {
      //
      //       },
      //       child: Text("சந்தா", style: TextStyle(fontSize: 12),),
      //       style: ElevatedButton.styleFrom(
      //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //         primary: Theme.of(context).primaryColor,
      //       ),
      //     ),
      //   ),
      //   SizedBox(
      //     width: 10,
      //   ),
      // ],
    );
  }
}
