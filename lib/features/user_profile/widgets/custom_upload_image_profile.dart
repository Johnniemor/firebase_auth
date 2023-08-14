import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

Future<void> customUploadImageProfile({
  required BuildContext context,
  required final Function(String?) onSelectImage,
}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
  if (photo != null) {
    onSelectImage(photo.path);
  }
}
