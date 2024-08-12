class ApiUrls {
  //base url
  static const String apiBaseUrl = "https://www.rishtazoro.com/";

  //auth apis
  static const String loginApi = "user/login.php";
  static const String signUpApi = "${apiBaseUrl}user/signup.php";

  //user details
  static const String getUserDetailsApi =
      "user/login.php?phone=8340465337&password=krishna123";

  //homeScreen apis
  static const String getBannerApi = "${apiBaseUrl}user/slider_api_front.php";
}
