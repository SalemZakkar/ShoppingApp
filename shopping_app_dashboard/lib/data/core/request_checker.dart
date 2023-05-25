import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/models/failure.dart';

mixin RequestChecker {
  Future<Either<Failure, T>> request<T>(var fun) async {
    try {
      return right(await fun());
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebase Auth issue");
      debugPrint(e.code);
      if (e.code == "too-many-requests") {
        return left(const Failure(type: FailureType.serverError));
      }
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(const Failure(type: FailureType.invalidArguments));
      }
      if (e.code == "network-request-failed") {
        return left(const Failure(type: FailureType.networkError));
      }
      return left(const Failure(type: FailureType.serverError));
    } on FirebaseException catch (e) {
      if (e.code == "network-request-failed") {
        return left(const Failure(type: FailureType.networkError));
      }
      if (e.code == "permission-denied") {
        return left(const Failure(type: FailureType.unAuthorized));
      }
      return left(const Failure(type: FailureType.serverError));
    } catch (e) {
      debugPrint("Other issue");
      debugPrint(e.toString());
      return left(const Failure(type: FailureType.serverError));
    }
  }

  String parseErrorCode(FirebaseAuthException exception) {
    return exception.message!.split("(").last.split(")").first;
  }
}
