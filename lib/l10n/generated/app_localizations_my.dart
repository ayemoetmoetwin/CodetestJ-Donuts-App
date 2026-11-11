// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'J\'Donuts App';

  @override
  String get onboardingTitle => 'စိတ်ကြိုက် အစားအစာ';

  @override
  String get letsGetStarted => 'စတင်လိုက်ပါ';

  @override
  String get alreadyHaveAccount => 'အကောင့်ရှိပြီးသားလား။ ';

  @override
  String get logIn => 'ဝင်ရန်';

  @override
  String get continueLabel => 'ရှေ့ဆက်ရန်';

  @override
  String get enterPhoneTitle => 'ဖုန်းနံပါတ် ထည့်ပါ';

  @override
  String get verifyTitle => 'နံပါတ်ကို အတည်ပြုပါ';

  @override
  String otpSent(String phone) {
    return 'သင့်ဖုန်းနံပါတ် $phone သို့ OTP ပို့ပြီးပါပြီ';
  }

  @override
  String get didntReceive => 'ကုဒ် မရဘူးလား။ ';

  @override
  String resendIn(String time) {
    return '$time မိနစ်အကြာ ပြန်ပို့နိုင်သည်';
  }

  @override
  String get resend => 'ပြန်ပို့ရန်';

  @override
  String get otpWrong => 'ကုဒ် မမှန်ပါ။';

  @override
  String get otpLocked => 'အကြိမ်များစွာ မှားထားသည်။ ကုဒ်အသစ် ပြန်ပို့ပါ။';

  @override
  String get nameTitle => 'နာမည် ဘယ်လိုခေါ်လဲ။';

  @override
  String get firstName => 'နာမည်';

  @override
  String get lastName => 'မျိုးရိုးအမည်';

  @override
  String get dobTitle => 'မွေးနေ့ ဘယ်နေ့လဲ။';

  @override
  String get monthHint => 'လ';

  @override
  String get dayHint => 'ရက်';

  @override
  String get yearHint => 'နှစ်';

  @override
  String get chooseDate => 'ရွေးချယ်ရန်';

  @override
  String get welcomeTitle => 'J\'donuts ကမ္ဘာကြီးမှ ကြိုဆိုပါတယ်';

  @override
  String get letsExplore => 'လေ့လာကြည့်မယ်';

  @override
  String get phoneInvalid => 'ဖုန်းနံပါတ် မှန်ကန်စွာ ထည့်ပါ။';

  @override
  String get nameRequired => 'နာမည် လိုအပ်သည်။';

  @override
  String get nameTooLong => 'စာလုံး ၅၀ ထက် မပိုရ။';

  @override
  String get nameInvalid => 'စာလုံးနှင့် space သာ သုံးပါ။';

  @override
  String get dobRequired => 'ရက်စွဲ အမှန် ထည့်ပါ။';

  @override
  String get dobNotReal => 'ပြက္ခဒိန်မှာ မရှိသော ရက်ဖြစ်သည်။';

  @override
  String get dobFuture => 'မွေးနေ့သည် အနာဂတ် မဖြစ်ရ။';

  @override
  String get dobTooYoung => 'အသက် ၁၃ နှစ် ပြည့်ရမည်။';

  @override
  String get notRegistered => 'ဤနံပါတ်ကို မှတ်ပုံမတင်ရသေးပါ။ ';

  @override
  String get registerAction => 'မှတ်ပုံတင်ရန်';

  @override
  String get alreadyRegistered => 'ဤနံပါတ်ကို မှတ်ပုံတင်ပြီးပါပြီ။ ';

  @override
  String get comingSoon => 'မကြာမီ ရရှိပါမည်။';

  @override
  String get terms => 'အသုံးပြုမှု စည်းကမ်း';

  @override
  String get privacy => 'ကိုယ်ရေးအချက်အလက် မူဝါဒ';

  @override
  String get legalLead => 'ရှေ့ဆက်ခြင်းဖြင့် ';

  @override
  String get legalAnd => ' နှင့် ';

  @override
  String get legalEnd => ' ကို သဘောတူပါသည်။';

  @override
  String get home => 'ပင်မ';

  @override
  String get reward => 'ဆု';

  @override
  String get favorites => 'အကြိုက်';

  @override
  String get cart => 'ခြင်း';

  @override
  String get inbox => 'စာ';

  @override
  String get settings => 'ဆက်တင်';

  @override
  String get language => 'ဘာသာစကား';

  @override
  String get english => 'အင်္ဂလိပ်';

  @override
  String get burmese => 'မြန်မာ';

  @override
  String get logOut => 'ထွက်ရန်';

  @override
  String get settingsBody => 'ထွက်ပြီးနောက် စတင်စာမျက်နှာသို့ ပြန်သွားသည်။';

  @override
  String get placeholderBody => 'ဤတဘ်သည် နေရာယူထားခြင်းသာ ဖြစ်သည်။';

  @override
  String get offlineBanner =>
      'အော့ဖ်လိုင်းဖြစ်နေသည်။ သိမ်းထားသော ဒိုနတ်များကို ပြထားသည်။';

  @override
  String shopsNear(int count) {
    return 'အနီးအနားတွင် J\'Donut ဆိုင် $count ဆိုင် ရှိသည်';
  }

  @override
  String get exploreNow => 'ကြည့်ရှုရန်';

  @override
  String get orderOnline => 'အွန်လိုင်း မှာယူရန်';

  @override
  String get whatsThis => 'ဒါက ဘာလဲ။';

  @override
  String get addToCart => 'ခြင်းထဲထည့်ရန်';

  @override
  String get addedToCart => 'ခြင်းထဲ ထည့်ပြီးပါပြီ';

  @override
  String get newBadge => 'အသစ်';

  @override
  String percentOff(int percent) {
    return '$percent% off';
  }

  @override
  String pointsLeft(String points, String tier) {
    return '$tier Member ဖြစ်ရန် $points မှတ် လိုသေးသည်';
  }

  @override
  String get rewardsTitle => 'J\' Donuts ဆုလာဘ်';

  @override
  String get totalPoints => 'စုစုပေါင်း မှတ်';

  @override
  String get youAreHere => 'သင် ဒီအဆင့်မှာ';

  @override
  String ptsRemaining(String points, String tier) {
    return '$tier ဖြစ်ရန်\n$points မှတ်\nလိုသေးသည်';
  }

  @override
  String get beHereSoon => 'မကြာမီ ဒီအဆင့်ရောက်မည်';

  @override
  String get eatMore => 'စားလေ ဆုရလေ';

  @override
  String get giftTab => 'လက်ဆောင်';

  @override
  String get earn => 'ရယူရန်';

  @override
  String get collected => 'ရယူပြီး';

  @override
  String get placeOrder => 'ငွေချေရန်';

  @override
  String get orderPlaced => 'အော်ဒါ တင်ပြီးပါပြီ။';

  @override
  String pointsShort(int points) {
    return '$points မှတ်';
  }

  @override
  String get emptySection => 'ဘာမှ မရှိသေးပါ။';

  @override
  String get sectionError => 'ဤအပိုင်းကို ဖွင့်မရပါ။';

  @override
  String get retry => 'ပြန်ကြိုးစားရန်';

  @override
  String get loadError => 'ဤစာမျက်နှာကို ဖွင့်မရပါ။';

  @override
  String get bronze => 'ကြေး';

  @override
  String get silver => 'ငွေ';

  @override
  String get gold => 'ရွှေ';

  @override
  String get platinum => 'ပလက်တီနမ်';

  @override
  String memberTier(String tier) {
    return '$tier အဖွဲ့ဝင်';
  }

  @override
  String get rewardsBadge => 'ဆုများ';

  @override
  String get cartTitle => 'ခြင်း';

  @override
  String get viewCart => 'ခြင်းကို ကြည့်ရန်';

  @override
  String get emptyCart => 'ခြင်းထဲတွင် ဘာမှ မရှိသေးပါ။';

  @override
  String get cartTotal => 'စုစုပေါင်း';

  @override
  String get removeItem => 'ဖယ်ရန်';
}
