import 'package:beach_combine/models/certification_requests.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CertificationDetailScreen extends StatefulWidget {
  CertificationDetailScreen({super.key, required this.certificationRequest});

  CertificationRequests certificationRequest;

  @override
  State<CertificationDetailScreen> createState() =>
      _CertificationDetailScreenState();
}

class _CertificationDetailScreenState extends State<CertificationDetailScreen> {
  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    addMarker();
    super.initState();
  }

  addMarker() async {
    print('마커 추가 시작');
    try {
      markers.add(
        Marker(
          markerId: MarkerId(widget.certificationRequest.id.toString()),
          position: LatLng(
            double.parse(widget.certificationRequest.lat),
            double.parse(widget.certificationRequest.lng),
          ),
          icon: await MarkerIcon.pictureAsset(
              assetPath: "assets/icons/trashcan.png", width: 100, height: 100),
        ),
      );
      setState(() {});
    } catch (e) {
      print(e);
    }
    print('마커추가완료');
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double middleSize = height / 1.6;
    double bottomSize = height - middleSize - 100;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Column(
            children: [
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90.0),
                        child: Image.network(
                          widget.certificationRequest.memberImage,
                          fit: BoxFit.fill,
                          width: 54,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.certificationRequest.nickname,
                            style:
                                Styles.body12Text.copyWith(color: Colors.black),
                          ),
                          Text(
                            widget.certificationRequest.date,
                            style: Styles.body3Text
                                .copyWith(color: Styles.gray1Color),
                          )
                        ],
                      ),
                      Spacer(),
                      widget.certificationRequest.isCertified
                          ? Image.asset(
                              'assets/icons/admin_trashcan_checked.png',
                              width: 37,
                            )
                          : Image.asset(
                              'assets/icons/admin_trashcan_unchecked.png',
                              width: 37,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: middleSize,
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        double.parse(widget.certificationRequest.lat),
                        double.parse(widget.certificationRequest.lng)),
                    zoom: 16.5,
                  ),
                  markers: markers,
                ),
              ),
              SizedBox(
                height: bottomSize,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlackButton(height: 60, text: 'Reject', onTap: () {}),
                      SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(height: 60, text: 'Comfirm', onTap: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/admin_profile.png',
                width: 54,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'data',
                    style: Styles.body12Text.copyWith(color: Colors.black),
                  ),
                  Text(
                    'data',
                    style: Styles.body3Text.copyWith(color: Styles.gray1Color),
                  )
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/icons/admin_trashcan_unchecked.png',
                width: 37,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
