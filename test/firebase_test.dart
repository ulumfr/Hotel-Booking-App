import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/controllers/auth/firebase/user_firebase_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/models/auth/user_firebase_model.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  group('UserFirebaseController', () {
    test('getUser gets data from a given document', () async {
      // Arrange
      final mockFirebaseFirestore = MockFirebaseFirestore();
      final mockDocumentSnapshot = MockDocumentSnapshot();
      final userFirebaseController = UserFirebaseController();

      const email = 'test@email.com';
      const user = {'id': '1', 'username': 'test', 'email': 'test@email.com', 'password': 'password', 'phone': '1234567890'};

      when(mockFirebaseFirestore.collection('users').doc(email).get())
          .thenAnswer((_) async => Future.value(mockDocumentSnapshot as FutureOr<DocumentSnapshot<Map<String, dynamic>>>?));
      when(mockDocumentSnapshot.exists).thenReturn(true);
      when(mockDocumentSnapshot.data()).thenReturn(user);

      // Act
      await userFirebaseController.getUser(email);

      // Assert
      expect(userFirebaseController.userdat.length, 1);
      expect(userFirebaseController.userdat[0].username, 'test');
      expect(userFirebaseController.userdat[0].email, 'test@email.com');
      expect(userFirebaseController.userdat[0].password, 'password');
      expect(userFirebaseController.userdat[0].phone, '1234567890');
    });
  });
}