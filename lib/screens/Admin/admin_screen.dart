import 'package:beach_combine/widgets/verification_request_card.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return VerificationRequestCard();
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        'assets/logo/logo_type_black.png',
        width: MediaQuery.of(context).size.width / 2.4,
      ),
    );
  }
}
