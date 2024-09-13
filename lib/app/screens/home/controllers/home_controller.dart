import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swavalamban/app/repositories/event_repository.dart';

import '../../../models/api_response.dart';
import '../../../models/blog_model.dart';
import '../../../models/event_model.dart';
import '../../../models/package_model.dart';
import '../../../models/settings_model.dart';
import '../../../models/slide_model.dart';
import '../../../models/top_performer_model.dart';
import '../../../models/user_model.dart';
import '../../../models/video_model.dart';
import '../../../repositories/member_repository.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../repositories/video_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/razorpay_gateway_service.dart';
import '../../members/controllers/member_controller.dart';
import '../../members/views/mebmer_screen.dart';
import '../views/comming_soon.dart';
import '../views/home_view.dart';
import '../views/videos_screen.dart';

class HomeController extends GetxController {
  Rx<User> user = User(
          firstName: "Omkar",
          lastName: "Mhatre",
          email: "karomhatre@gmail.com",
          phoneNumber: "+919969383542")
      .obs;

  RxInt setTabIndex = 0.obs;
  RxBool isLiveAuction = true.obs;
  RxBool showMoreOptions = false.obs;
  List<String> moreOptions = ["Profile", "Logout"];
  RxString itemView = "LIST".obs;

  late var scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _userRepository;
  late SliderRepository _sliderRepository;
  late VideoRepository _videoRepository;
  late MemberRepository _memberRepository;
  late EventRepository _eventRepository;
  // late VendorRepository _vendorRepository;

  HomeController() {
    // Get.find<AuthService>().user.listen((updatedUser) {
    //   user.value = updatedUser;
    // });

    _userRepository = UserRepository();
    _sliderRepository = SliderRepository();
    _videoRepository = VideoRepository();
    _memberRepository = MemberRepository();
    _eventRepository = EventRepository();
    // _vendorRepository = VendorRepository();
  }

  RxBool searchedClicked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = false;

    user.value = Get.find<AuthService>().user.value;
    user.listen((updatedUser) {
      Get.find<AuthService>().user.value = updatedUser;
    });

    // if (Get.arguments != null) {
    //   setTabIndex.value = int.parse(Get.arguments["tabIndex"] as String);
    // }
    super.onInit();
    setTabIndex.listen((p0) {
      if (p0 == 1) {
        Get.find<MemberController>().fetchMmebersByProfession();
      } else if (p0 == 2) {
        fetchVideos();
      }
    });

    homeRefresh(refresh: false);
  }

  // TABS
  final List bottomTabs = [
    {
      "title": "Home",
      "icon": "assets/ui/nav/home.png",
      "pos": "0",
      "view": const HomeView()
    },
    {
      "title": "Members",
      "icon": "assets/ui/nav/card.png",
      "pos": "1",
      "view": const MemberScreen()
    },

    {
      "title": "Videos",
      "icon": "assets/ui/nav/order.png",
      "pos": "2",
      "view": const VideosScreen()
    },
    // {
    //   "title": "Profile",
    //   "icon": "assets/ui/nav/gift.png",
    //   "pos": "3",
    //   "view": const CommingSoonView()
    // },
    {
      "title": "Profile",
      "icon": "assets/ui/nav/store.png",
      "pos": "3",
      "view": const CommingSoonView()
    },
    // {
    //   "title": "FAQ's",
    //   "icon": "assets/ui/setting_icon.png",
    //   "pos": "3",
    //   "view": Container()
    // }
  ];

  getTabScreen(index) {
    return bottomTabs[index]["view"];
  }

  void updateHome() async {
    // await _userRepository.fetchUser().then((value) {
    //   user.value = value;
    //   user.refresh();
    // });
  }

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        user = User().obs;
        user.value = value.data;
        // user.value.membershipId = u0.membershipId;
        // user.value.balance = u0.balance;
        user.refresh();
      } else {
        Get.find<AuthService>().removeCurrentUser();
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  DateFormat formater = DateFormat("dd/MM/yy");
  String getWeekDay(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("EEE").format(dateTime);
  }

  String getDate(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("d").format(dateTime);
  }

  RxBool isGridView = true.obs;

  void homeRefresh({bool? refresh}) async {
    // updateUser();
    // fetchPackages();
    fetchSliders(refresh ?? true);
    fetchAds(refresh ?? true);
    fetchNotice();
    fetchEvents();
    fetchMembers();
    fetchperformers();
    // fetchVideos();
    // Get.find<CategoryController>().fetchCategories();
    // fetchBlogs();
  }

  late Timer sliderTimer;
  PageController sliderPageController = PageController(initialPage: 0);

//SLIDERS
  RxList<Slide> sliders = <Slide>[].obs;
  RxInt selectedSlide = (-1).obs;
  fetchSliders(bool refresh) async {
    sliders.value = [];
    await _sliderRepository.fetchSliders().then((value) {
      if (value.status == Status.COMPLETED) {
        if (value.data != []) {
          sliders.value = value.data;
          selectedSlide.value = 0;
          if (!refresh) {
            sliderTimer =
                Timer.periodic(const Duration(milliseconds: 3000), (timer) {
              sliderPageController.animateToPage(
                  (sliderPageController.page!.toInt() + 1 % sliders.length),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn);
            });
          } else {
            sliderTimer.cancel();
            sliderTimer =
                Timer.periodic(const Duration(milliseconds: 3000), (timer) {
              sliderPageController.animateToPage(
                  (sliderPageController.page!.toInt() + 1 % sliders.length),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn);
            });
          }
        } else {}
        sliders.refresh();
      }
    });
  }

  // NOTICE
  RxString notice = "Loading ..".obs;
  fetchNotice() async {
    blogs.value = [];
    _sliderRepository.fetchNotices().then((value) {
      if (value.status == Status.COMPLETED) {
        var noticies = "";
        for (var notice in (value.data as List<Notice>)) {
          noticies = "$noticies ${notice.notice}\t";
        }
        notice.value = noticies.trim();
        notice.refresh();
      }
    });
  }

//BLOGS
  RxList<Blog> blogs = <Blog>[].obs;
  Rx<Blog> selectedBlog = Blog().obs;
  fetchBlogs() async {
    blogs.value = [];
    _sliderRepository.fetchBlogs().then((value) {
      if (value.status == Status.COMPLETED) {
        blogs.value = value.data;
      }
    });
  }

//MEMBERS
  RxList<User> members = <User>[].obs;
  Rx<User> selectedMember = User().obs;
  fetchMembers() async {
    isLoading.value = true;
    members.value = [];
    _memberRepository.fetchNewMembers().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        members.value = value.data;
        members.refresh();
      }
    });
  }

  //EVENTS
  RxList<Event> events = <Event>[].obs;
  Rx<Event> selectedEvent = Event().obs;
  fetchEvents() async {
    isLoading.value = true;
    events.value = [];
    _eventRepository.fetchEvents().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        events.value = value.data;
        events.refresh();
      }
    });
  }

//MEMBERS
  RxList<Member> performers = <Member>[].obs;
  Rx<Member> selectedPerformer = Member().obs;
  fetchperformers() async {
    isLoading.value = true;
    performers.value = [];
    _memberRepository.fetchTopPerformers().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        performers.value = value.data;
        performers.refresh();
      }
    });
  }

  void onRoleSelected(Map<String, dynamic> element) {
    Get.toNamed(Routes.PACKAGES);
  }

  RxList<Package> packages = <Package>[].obs;
  fetchPackages() async {
    packages.value = [];
    await _sliderRepository.fetchPackages().then((value) {
      if (value.status == Status.COMPLETED) {
        packages.value = value.data;
      }
    });
  }

  void onPackageSelected(Package selectedPackage) {
    // Get.toNamed(Routes.TEMPLATES);
    RazorpayPG.getInstance.razorpayPayment("hhwvfwvfwyy1546aqafa");
  }

  // SETTINGS

  // TERMS N CONDITIONS
  RxString termsNConditions = "".obs;
  fetchTermsnConditions() async {
    isLoading.value = true;
    _sliderRepository.fetchTermsNConditions().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        var terms = "";
        for (var term in (value.data as List<Setting>)) {
          terms = "$terms ${term.content}\n";
        }
        termsNConditions.value = terms.trim();
        termsNConditions.refresh();
      }
    });
  }

  //PRIVACY POLICY
  RxString privacyPolicy = "".obs;
  fetchPrivacyPolicy() async {
    isLoading.value = true;
    _sliderRepository.fetchPrivacyPolicy().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        var policies = "";
        for (var policy in (value.data as List<Setting>)) {
          policies = "$policies ${policy.content}\n";
        }
        privacyPolicy.value = policies.trim();
        privacyPolicy.refresh();
      }
    });
  }

  //ABOUT US
  RxString aboutUs = "".obs;
  fetchAboutUs() async {
    isLoading.value = true;
    _sliderRepository.fetchAboutUs().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        var aboutUsStr = "";
        for (var about in (value.data as List<Setting>)) {
          aboutUsStr = "$aboutUsStr ${about.content}\n";
        }
        aboutUs.value = aboutUsStr.trim();
        aboutUs.refresh();
      }
    });
  }

  //VIDEOS
  RxList<Video> videos = <Video>[].obs;
  fetchVideos() async {
    videos.value = [];
    isLoading.value = true;
    _videoRepository.fetchVideos().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        videos.value = value.data;
        videos.refresh();
      }
    });
  }

  //ADS
  RxList<Slide> ads = <Slide>[].obs;
  RxInt selectedAd = (-1).obs;
  late Timer adTimer;
  PageController adsPageController = PageController(initialPage: 0);
  fetchAds(bool refresh) async {
    ads.value = [];
    await _sliderRepository.fecthAds().then((value) {
      if (value.status == Status.COMPLETED) {
        if (value.data != []) {
          ads.value = value.data;
          selectedAd.value = 0;
          // if (!refresh) {
          //   adTimer =
          //       Timer.periodic(const Duration(milliseconds: 3000), (timer) {
          //     adsPageController.animateToPage(
          //         (adsPageController.page!.toInt() + 1 % ads.length),
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeIn);
          //   });
          // } else {
          //   adTimer.cancel();
          //   adTimer =
          //       Timer.periodic(const Duration(milliseconds: 3000), (timer) {
          //     adsPageController.animateToPage(
          //         (adsPageController.page!.toInt() + 1 % ads.length),
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeIn);
          //   });
          // }
        } else {}
        ads.refresh();
      }
    });
  }
}
