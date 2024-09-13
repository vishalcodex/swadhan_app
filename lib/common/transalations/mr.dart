import 'translation_keys.dart' as translation;

class Mr {
  Map<String, String> get messages => {
        translation.appName: "श्रमिक",
        translation.eng: "English",
        translation.mar: "मराठी",

        //Splash Buttons
        translation.alreadyAMember: " मी सभासद आहे ",
        translation.registerAsMember: "मला सभासद व्हायचं आहे",

        //Error Messages
        translation.errorOccured: "An Error occured",
        translation.connectionTimeout: "Connection Timeout",

        // Login
        translation.login: "लॉगइन",
        translation.email: "ई-मेल",
        translation.password: "पासवर्ड",
        translation.emailIsEmpty: "Email should not be empty.",
        translation.passwordIsEmpty: "Password should not be empty",
        translation.successfulLoginMsg:
            "You have Logged In Successfully!\nSetting Up Your Account !",
        translation.invalidCreds: "Invalid Credentials !",
        translation.registeredSuccessfully: "You have Registered Successfully!",

        // Number Verification
        translation.welcome: "सुस्वागतम",
        translation.enterNumberToContinue: "आपला संपर्क क्रमांक टाका",
        translation.sixDigitOtp: "एक सहा आकडी OTP आपल्या नंबर वर पाठवला जाईल ",
        translation.sendOtp: "OTP पाठवा",
        translation.invalidOtp: "Invalid OTP",
        translation.invalidPhoneNumber: "Invalid Phone Number",
        translation.phoneNumberVerified: "Phone Number verified Successfully !",

        // OTP Verification
        translation.sixDigitOtpSent:
            "एक सहा आकडी OTP आपल्या नंबर वर पाठवला जाईल कृपया तो OTP टाका जेणेकरून आपला फोन नंबर पडताळणी होऊ शकेल ",
        translation.verifyOtp: " OTP व्हेरिफाय करा ",

        //Register
        translation.registration: "नोंदणी करा",
        translation.fullName: "पूर्ण नाव ",
        translation.phoneNumber: "फोन नंबर",

        //Sign Up
        translation.signUp: "नवीन नोंदणी करा",
        translation.profile: "माझी माहिती",
        translation.updateProfileDetails: "प्रोफाईल अपडेट करा",
        translation.next: "पुढे",
        translation.detailsSubmitted: "माहिती यशस्वीरीत्या जमा झाली !!",
        translation.detailsUpdated: "माहिती यशस्वीरीत्या जमा झाली !!",
        translation.settingAppToHome: "अँप लोड होत आहे..",
        translation.errorUpdatingDetails:
            "Error Occured while Updating Details !",
        translation.registrationComplete:
            "Registration Complete!\nमाहिती यशस्वीरीत्या जमा झाली !",

        //Personal

        translation.isRequired: "आवश्यक",
        translation.persoanalDetails: "व्यक्तिगत माहिती",
        translation.profileImg: "स्वतःचा फोटो",
        translation.name: "नाव",
        translation.whatsappNumber: "व्हॉटसप नंबर",
        translation.telegramNumber: "टेलिग्राम नंबर",
        translation.dob: "जन्मतारीख",
        translation.marriageAnniversary: "लग्नाचा वाढदिवस ",
        translation.gender: "लिंग",
        translation.bloodGrp: "रक्त गट",
        translation.caste: "जात",
        translation.subCaste: "उपजात",
        translation.aadhaarNumber: "आधारकार्ड नंबर.",
        translation.panNumber: "पॅन कार्ड नंबर.",
        translation.resedentialAddress: "राहण्याचा पत्ता",
        translation.resedentialDistrict: "जिल्हा",
        translation.resedentialTaluka: "तालुका",
        translation.resedentialCity: "शहर/गाव",
        translation.resedentialPinCode: "पिन कोड",
        translation.nativeAddress: "गावाचे नाव",
        translation.nativeDistrict: "जिल्हा",
        translation.nativeTaluka: "तालुका",
        translation.nativeCity: "शहर/गाव",
        translation.nativePinCode: "पिन कोड",
        translation.nomineeName: "नॉमिनी नाव",
        translation.nomineeRelation: "नॉमिनी नाते",
        translation.nomineeDob: "नॉमिनी जन्मतारीख",
        translation.nomineeContact: "नॉमिनी संपर्क क्रमांक ",
        translation.nomineeEducation: "नॉमिनी शिक्षण",

        //Political
        translation.politicalDetails: "राजकीय माहिती ",
        translation.mhpardeshiCommittee: "महाराष्ट्र राज्य कमिटी",
        translation.regionalCommittee: "रिजनल कमिटी",
        translation.districtCityCommittee: "जिल्हास्तरीय/शहर कमिटी ",
        translation.talukaCommittee: "तालुका विधानसभा कमिटी",
        translation.villageWardCommittee: "गाव/वॉर्ड कमिटी",

        //Working
        translation.workingDetails: "कामाची माहिती",
        translation.midcName: "MIDC नाव",
        translation.occupCategory: "कामाची श्रेणी ",
        translation.subOccupCategory: "कामाची उपश्रेणी ",
        translation.workPlaceName: "कंपनीचे नाव/ कामाच्या ठिकाणचे नाव ",
        translation.workPlaceAddress: "कामाचा पत्ता",
        translation.workPlacePinCode: "कामाच्या पत्त्याचा पिनकोड",
        translation.accPerson: "जबाबदार व्यक्तीचे नाव",
        translation.accPersonContactNumber: "जबाबदार व्यक्ती संपर्क क्रमांक",
        translation.pfNumber: "पीएफ क्रमांक",
        translation.stateLabourSchema:
            "State Labour Insurance Scheme (E.S.I.C.)",
        //Family
        translation.familyDetails: "कौटुंबिक तपशील",
        translation.fatherName: "वडिलांचे नाव",
        translation.fatherDOB: "वडिलांची जन्मतारीख",
        translation.fatherContactNumber: "वडिलांचा संपर्क क्रमांक",
        translation.fatherEducation: "वडिलांचे शिक्षण",
        translation.fatherPersonType: "वडिलांची स्थिती",
        translation.motherName: "आईचे नाव ",
        translation.motherDOB: "आईची जन्मतारीख",
        translation.motherContactNumber: "आईचा संपर्क क्रमांक",
        translation.motherEducation: "आईचे शिक्षण ",
        translation.motherPersonType: "आईची स्थिती",
        translation.wifeName: "पत्नीचे  नाव ",
        translation.wifeDOB: "पत्नीची  जन्मतारीख",
        translation.wifeContactNumber: "पत्नीचा  संपर्क क्रमांक",
        translation.wifeEducation: "पत्नीचे  शिक्षण",
        translation.wifePersonType: "पत्नीची स्थिती",
        translation.children1Name: "मुलाचे नाव",
        translation.children1DOB: "मुलाची  जन्मतारीख",
        translation.children1ContactNumber: "मुलाचा  संपर्क क्रमांक",
        translation.children1Education: "मुलाचे शिक्षण",
        translation.children1PersonType: "मुलाची स्थिती",
        translation.children2Name: "मुलाचे नाव",
        translation.children2DOB: "मुलाची  जन्मतारीख",
        translation.children2ContactNumber: "मुलाचा  संपर्क क्रमांक",
        translation.children2Education: "मुलाचे शिक्षण",
        translation.children2PersonType: "मुलाची स्थिती",
        //Scheme
        translation.schemeDetails: "योजनेची माहिती",
        translation.optForScheme:
            "ह्या आधी कधी सरकारी योजनेचा लाभ घेतला आहे का? ?",
        translation.yes: "होय",
        translation.no: "नाही",
        translation.schemeName: "योजनेचे नाव",
        translation.submit: "जमा करा",

        // Home
        translation.home: "होम",
        translation.impUpdates: "महत्चाच्या बातम्या",
        translation.readMore: "Read More",

        // Membership Card
        translation.memCard: "सभासद कार्ड",
        translation.membershipDetails: "सभासदत्वची  माहिती ",
        translation.memberName: "सभासद नाव ",
        translation.companyDetails: "कंपनीची माहिती ",
        translation.companyName: "कंपनीचे नाव",
        translation.companyAddress: "कंपनीचा पत्ता ",
        translation.optedForScheme: "लाभ घेत असलेली योजना ",

        //Contact Us
        translation.contactUs: "संपर्क करा",

        //Side Bar
        translation.aboutUs: "आमची माहिती",
        translation.termsNConditions: "नियम व अटी",
        translation.followUs: "अनुसरण करा",
        translation.chooseLang: "भाषा निवडा",
        translation.logout: "बाहेर पडा",

        //Blog
        translation.blogDetails: "Blog Details",
      };
}
