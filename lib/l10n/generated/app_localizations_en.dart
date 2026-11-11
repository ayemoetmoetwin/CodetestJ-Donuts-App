// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'J\'Donuts App';

  @override
  String get onboardingTitle => 'Round Food for\nevery mood';

  @override
  String get letsGetStarted => 'LET\'S GET STARTED';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get logIn => 'Log in';

  @override
  String get continueLabel => 'CONTINUE';

  @override
  String get enterPhoneTitle => 'Enter your phone number';

  @override
  String get verifyTitle => 'Verify your number';

  @override
  String otpSent(String phone) {
    return 'OTP is already sent to your phone number $phone';
  }

  @override
  String get didntReceive => 'Didn\'t receive the code? ';

  @override
  String resendIn(String time) {
    return 'resend in $time min';
  }

  @override
  String get resend => 'Resend';

  @override
  String get otpWrong => 'That code is not right.';

  @override
  String get otpLocked => 'Too many tries. Resend a new code.';

  @override
  String get nameTitle => 'What\'s your name?';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get dobTitle => 'What\'s your date of birth?';

  @override
  String get monthHint => 'Month';

  @override
  String get dayHint => 'Day';

  @override
  String get yearHint => 'Year';

  @override
  String get chooseDate => 'Choose';

  @override
  String get welcomeTitle => 'Welcome to the\nworld of J\'donuts';

  @override
  String get letsExplore => 'LET\'S EXPLORE';

  @override
  String get phoneInvalid => 'Enter a valid mobile number.';

  @override
  String get nameRequired => 'First name is required.';

  @override
  String get nameTooLong => 'Use 50 characters or fewer.';

  @override
  String get nameInvalid => 'Use letters and spaces only.';

  @override
  String get dobRequired => 'Enter a real date.';

  @override
  String get dobNotReal => 'That date is not on the calendar.';

  @override
  String get dobFuture => 'Date of birth cannot be in the future.';

  @override
  String get dobTooYoung => 'You need to be at least 13.';

  @override
  String get notRegistered => 'This number is not registered. ';

  @override
  String get registerAction => 'Register';

  @override
  String get alreadyRegistered => 'This number is already registered. ';

  @override
  String get comingSoon => 'This will be available soon.';

  @override
  String get terms => 'Terms of Use';

  @override
  String get privacy => 'Privacy Policy';

  @override
  String get legalLead =>
      'By continuing, you acknowledge that you have read and agree to our ';

  @override
  String get legalAnd => ' and ';

  @override
  String get legalEnd => '.';

  @override
  String get home => 'Home';

  @override
  String get reward => 'Reward';

  @override
  String get favorites => 'Favorites';

  @override
  String get cart => 'Cart';

  @override
  String get inbox => 'Inbox';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get burmese => 'Burmese';

  @override
  String get logOut => 'Log out';

  @override
  String get settingsBody => 'Log out to return to onboarding.';

  @override
  String get placeholderBody => 'This tab is a placeholder.';

  @override
  String get offlineBanner => 'You are offline. Showing saved donuts.';

  @override
  String shopsNear(int count) {
    return 'There are $count J\'Donut shops near you';
  }

  @override
  String get exploreNow => 'EXPLORE NOW';

  @override
  String get orderOnline => 'Order Online';

  @override
  String get whatsThis => 'What\'s this?';

  @override
  String get addToCart => 'ADD TO CART';

  @override
  String get addedToCart => 'Added to cart';

  @override
  String get newBadge => 'New';

  @override
  String percentOff(int percent) {
    return '$percent% off';
  }

  @override
  String pointsLeft(String points, String tier) {
    return '$points points left to become $tier Member';
  }

  @override
  String get rewardsTitle => 'J\' Donuts Rewards';

  @override
  String get totalPoints => 'Total points';

  @override
  String get youAreHere => 'You\'re here now';

  @override
  String ptsRemaining(String points, String tier) {
    return '$points pts\nRemaining to\nbecome $tier';
  }

  @override
  String get beHereSoon => 'You\'ll be here soon';

  @override
  String get eatMore => 'Eat more earn more';

  @override
  String get giftTab => 'Gift';

  @override
  String get earn => 'EARN';

  @override
  String get collected => 'Collected';

  @override
  String get placeOrder => 'Checkout';

  @override
  String get orderPlaced => 'Order placed.';

  @override
  String pointsShort(int points) {
    return '$points pts';
  }

  @override
  String get emptySection => 'Nothing here yet.';

  @override
  String get sectionError => 'This section could not load.';

  @override
  String get retry => 'Try again';

  @override
  String get loadError => 'We could not load this screen.';

  @override
  String get bronze => 'Bronze';

  @override
  String get silver => 'Silver';

  @override
  String get gold => 'Gold';

  @override
  String get platinum => 'Platinum';

  @override
  String memberTier(String tier) {
    return '$tier member';
  }

  @override
  String get rewardsBadge => 'Rewards';

  @override
  String get cartTitle => 'Your cart';

  @override
  String get viewCart => 'View cart';

  @override
  String get emptyCart => 'Your cart is empty.';

  @override
  String get cartTotal => 'Total';

  @override
  String get removeItem => 'Remove';
}
