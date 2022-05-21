import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../infrastructure/models/models.dart';
import '../domain/entities/entities.dart';
import '../infrastructure/datasourcers/datasourcers.dart';

class AnnotationDataSourceImplementation implements AnnotationDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;
  final Uuid _uuid;

  AnnotationDataSourceImplementation(
    this._auth,
    this._uuid,
    this._firebaseFirestore,
  );

  @override
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity}) async {
    try {
      final generateId = _uuid.v1();
      await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Annotation')
          .doc(generateId)
          .set({
        'title': annotationEntity.title,
        'description': annotationEntity.description,
        'id': generateId,
      });
      return Right(annotationEntity);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }

  @override
  Future<Either<Exception, EditAnnotationEntity>> editAnnotation(
      {required EditAnnotationEntity editAnnotationEntity}) async {
    try {
      await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Annotation')
          .doc(editAnnotationEntity.id)
          .set({
        'title': editAnnotationEntity.title,
        'description': editAnnotationEntity.description,
        'id': editAnnotationEntity.id,
      });
      return Right(editAnnotationEntity);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getTodo() async {
    try {
      final getTodo = await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Annotation')
          .get();
      final result = List<AnnotationModel>.from(
        getTodo.docs.map(
          (e) => AnnotationModel.fromMap(e.data()),
        ),
      );
      return Right(result);
    } catch (e) {
      return Left(Exception(''));
    }
  }

  @override
  Future<Either<Exception, RemoveAnnotationEntity>> removeAnnotation(
      {required RemoveAnnotationEntity removeAnnotationEntity}) async {
    try {
      await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Annotation')
          .doc(removeAnnotationEntity.id)
          .delete();
      return Right(removeAnnotationEntity);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }
}
