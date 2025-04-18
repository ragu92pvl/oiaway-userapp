

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../../constants/app_style.dart';
import '../../../controller/home_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends StateX<ProfilePage> {

  _ProfilePageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getProfile(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: con.profileResponse.data!=null ?  Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF0052CC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          con.profileResponse.data!.name!,
                          style: AppStyle.fontSarabunBold.override(fontSize: 18,color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          con.profileResponse.data!.mobile!,
                          style: AppStyle.fontSarabunMedium.override(fontSize: 18,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildMenuItem(Icons.inventory_2, "My Product"),
          _buildMenuItem(Icons.help_outline, "My Enquiry"),
          _buildMenuItem(Icons.location_on, "My Address"),
          _buildMenuItem(Icons.settings, "Setting"),
          _buildMenuItem(Icons.logout, "Log Out"),
        ],
      ):Container()
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF0052CC)),
        title: Text(title, style: AppStyle.fontSarabunMedium.override(fontSize: 18,color: Colors.black87)),
        onTap: () {
          // Handle tap
          if(title == "My Product"){
            context.pushNamed('my-records-page');
          }else if(title == "My Enquiry"){

          }else if(title == "My Address"){
              context.pushNamed('address-page');
          }else if(title == "Setting"){

          }else if(title == "Log Out"){

          }
        },
      ),
    );
  }
}
