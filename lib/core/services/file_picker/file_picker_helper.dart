import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FileFailure {
  final String message;
  
  FileFailure(this.message);
}

class FileService {
  // Method to pick any file with Either return type
  Future<Either<FileFailure, PlatformFile?>> pickFile() async {
    try {
      if (await _requestPermission()) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.any,
          allowMultiple: false,
        );

        if (result != null && result.files.isNotEmpty) {
          PlatformFile file = result.files.first;
          return Right(file);
        } else {
          // User canceled file picking
          return const Right(null);
        }
      } else {
        return Left(FileFailure('Storage permission denied'));
      }
    } catch (e) {
      return Left(FileFailure('Error picking file: $e'));
    }
  }

  // Method to pick images only
  Future<Either<FileFailure, PlatformFile?>> pickImage() async {
    try {
      if (await _requestPermission()) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
        );

        if (result != null && result.files.isNotEmpty) {
          PlatformFile file = result.files.first;
          return Right(file);
        } else {
          // User canceled image picking
          return const Right(null);
        }
      } else {
        return Left(FileFailure('Storage permission denied'));
      }
    } catch (e) {
      return Left(FileFailure('Error picking image: $e'));
    }
  }

  // Request storage permission
  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }
      return status.isGranted;
    }
    return true; // iOS handles permissions differently
  }
}