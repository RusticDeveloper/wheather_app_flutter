String apiurl(lattitude, longitude) {
  String url =
      "https://weatherapi-com.p.rapidapi.com/forecast.json?q=$lattitude,$longitude&days=3&lang=es";
  return url;
}
