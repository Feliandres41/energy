import 'package:energy/providers/provider_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget implements PreferredSizeWidget{
  const ProfileWidget({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
  

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              // spacing: 10,
              children: [
                // GestureDetector(
                //   onTap: () => showC = true,
                //   child: Icon(Icons.person)
                //   ),
                // Text(' | '),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  
                  child: Text(Provider.of<ProviderApi>(context).correo),
                ),
                Text('  | '),
                Icon(Icons.person)
              ],
            ),
          )
        ],
      );
  }
  
  
}