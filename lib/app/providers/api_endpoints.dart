class Urls {
  static const baseUrl = "https://swadhan.digitalji.in/";
  static const apiPath = "api/";
  static const imagePath = "storage/";
  static const login = "login";
  static const tokenLogin = "";
  static const register = "register";
  static const forgotPassword = "forgotPassword";
  static const users = "users";
  static const occupations = "occupations";

  static String getApiUrl(endpoint) {
    var url = "";
    url =
        // ignore: prefer_interpolation_to_compose_strings
        baseUrl + apiPath + endpoint;
    // (id != 0 ? "/" + id.toString() : "") +
    // (token != "" ? "?token=" + token : "");
    return url;
  }

  static String getImageUrl(image) {
    var url = "";
    url =
        // ignore: prefer_interpolation_to_compose_strings
        baseUrl + imagePath + image;
    // (id != 0 ? "/" + id.toString() : "") +
    // (token != "" ? "?token=" + token : "");
    return url;
  }
}
