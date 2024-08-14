import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseFunction {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void writeData(
      Map<String, String> taskListName, Map<String, bool> taskCondition) async {
    if (user != null) {
      // Combine taskListName and taskCondition into a single map
      Map<String, dynamic> dataToSave = {
        'TaskListName': taskListName,
        'TaskCondition': taskCondition
      };

      try {
        // Write the combined data to Firestore
        await firestore
            .collection('Data')
            .doc(user!.email)
            .set(dataToSave);
      } catch (e) {
        print("Error writing data to Firestore: $e");
      }
    } else {
      print("User is not logged in.");
    }
  }

  Future<Map<String, dynamic>?> readFunction() async {
    if (user != null) {
      // Read data from Firestore
      try {
        DocumentSnapshot documnet =
            await firestore.collection('Data').doc(user!.email).get();
        if (documnet.exists) {
          return documnet as Map<String, dynamic>?;
        } else {
          print('no Data Found');
         
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("User is not logged in.");
      
    }
    return null;
  }

  void updateTaskCondition(Map<String, bool> taskCondition) async {
    if (user != null) {
      try {
        // Update only the 'TaskCondition' field in the document
        await firestore.collection('Data').doc(user!.email).update({
          'TaskCondition': taskCondition,
        });
      } catch (e) {
        print("Error updating task condition in Firestore: $e");
      }
    } else {
      print("User is not logged in.");
    }
  }
}
