// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_practice/utils/utils.dart';
// import 'package:firebase_practice/widgets/my_round_button.dart';
// import 'package:flutter/material.dart';
//
// import '../constants/app_colors.dart';
//
// class AddPost extends StatefulWidget {
//   const AddPost({super.key});
//
//   @override
//   State<AddPost> createState() => _AddPostState();
// }
//
// class _AddPostState extends State<AddPost> {
//   final myController = TextEditingController();
//
//   bool loading = false;
//
//   DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Path');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.defaultColor,
//         title: Text(
//           'Add Post',
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 maxLines: 3,
//                 controller: myController,
//                 decoration: InputDecoration(
//                   hintText: 'Write something...',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               MyRoundButton(
//                 title: 'Add Post',
//                 loading: loading,
//                 onTap: () async {
//                   await databaseRef.child('1').set({
//                     'title': 'Aabis',
//                   }).then((value) {
//                     Utils().showToastMessage('Successful');
//                     print('successful');
//                   }).onError((error, stackTrace) {
//                     Utils().showToastMessage(error.toString());
//                     print(error.toString());
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_practice/widgets/my_round_button.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            MyRoundButton(
                title: 'Add',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });

                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'title': 'Aabis',
                    // 'id': DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value) {
                    Utils().showToastMessage('Post added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().showToastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
