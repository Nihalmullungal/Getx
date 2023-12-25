import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/view/home_screen.dart';

class SplashScreenController extends GetxController {
  void init() async {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const HomeScreen());
    });
  }

  String imagepicked = "";
  Future<void> imagepickerfromgallery() async {
    ImagePicker picker = ImagePicker();
    final _image = await picker.pickImage(source: ImageSource.gallery);
    imagepicked = _image!.path;
    update();
  }

  void imageupdate() {
    imagepicked = "";
    update();
  }
}
