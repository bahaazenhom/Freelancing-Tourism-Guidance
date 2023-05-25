import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism/models/user_model.dart';

late UserModel MyAccount;
late UserCredential SignedinUser;
String ImageUrl="https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png";

List<dynamic> postsList = [];
List<dynamic> myServices=[];
List<dynamic> myProposal=[];