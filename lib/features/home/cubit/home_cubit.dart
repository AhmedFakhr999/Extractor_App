import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr/core/services/file_picker/file_picker_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FileService _fileService;
  
  HomeCubit(this._fileService) : super(HomeInitial());

  // Pick file method using dartz Either
  Future<void> pickFile() async {
    emit(HomeLoading());
    
    final result = await _fileService.pickFile();
    
    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (file) => emit(HomeSuccess(file)),
    );
  }

  // Pick image method
  Future<void> pickImage() async {
    emit(HomeLoading());
    
    final result = await _fileService.pickImage();
    
    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (file) => emit(HomeSuccess(file)),
    );
  }

  // Clear selected file
  void clearFile() {
    emit(HomeInitial());
  }
}