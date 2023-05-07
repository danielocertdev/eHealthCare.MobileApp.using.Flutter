import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/speciality_model.dart';
import '../../../routes/app_routes.dart';

class SpecialityListItemWidget extends StatelessWidget {
  final Speciality speciality;
  final String heroTag;
  final bool expanded;

  SpecialityListItemWidget({Key key, this.speciality, this.heroTag, this.expanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: Ui.getBoxDecoration(
          border: Border.fromBorderSide(BorderSide.none),
          gradient: new LinearGradient(
              colors: [Colors.purple.withOpacity(0.7), Colors.purple.withOpacity(0.1)],
              begin: AlignmentDirectional.topStart,
              //const FractionalOffset(1, 0),
              end: AlignmentDirectional.topEnd,
              stops: [0.0, 0.5],
              tileMode: TileMode.clamp)),
      child: Theme(
        data: Get.theme.copyWith(dividerColor: Colors.white),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.white,
              onTap: () {
                Get.toNamed(Routes.SPECIALITY, arguments: speciality);
                //Navigator.of(context).pushNamed('/Details', arguments: RouteArgument(id: '0', param: market.id, heroTag: heroTag));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: (speciality.image.url.toLowerCase().endsWith('.svg')
                        ? SvgPicture.network(
                            speciality.image.url,
                            color: Colors.yellow,
                            height: 100,
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: speciality.image.url,
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error_outline),
                          )),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      speciality.name,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Get.textTheme.bodyText2,
                    ),
                  ),
                  // TODO get doctor for each speciality
                  // Text(
                  //   speciality.doctors.length.toString(),
                  //   overflow: TextOverflow.fade,
                  //   softWrap: false,
                  //   style: Get.textTheme.caption.merge(TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold)),
                  // ),
                ],
              )),
          children: List.generate(speciality.subSpecialities?.length ?? 0, (index) {
            var _speciality = speciality.subSpecialities.elementAt(index);
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SPECIALITY, arguments: _speciality);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Text(_speciality.name, style: Get.textTheme.bodyText1),
                decoration: BoxDecoration(
                  color: Get.theme.scaffoldBackgroundColor.withOpacity(0.2),
                  border: Border(top: BorderSide(color: Get.theme.scaffoldBackgroundColor.withOpacity(0.3))
                      // color: Get.theme.focusColor.withOpacity(0.2),
                      ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
