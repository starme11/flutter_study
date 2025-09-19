class Data {
  final Map<String, dynamic> data;

  Data.fromJson(Map<String, dynamic> json) : data = json["data"];
}

class BaseUrl {
  final String baseUrl;
  final Sleep sleep;
  final API api;

  BaseUrl({required this.baseUrl, required this.sleep, required this.api});

  factory BaseUrl.fromJson(Map<String, dynamic> json) {
    return BaseUrl(
      baseUrl: json["base-url"],
      sleep: Sleep.fromJson(json["sleep"]),
      api: API.fromJson(json["api"]),
    );
  }
}

class Sleep {
  final Download download;
  final List<ErrorSleepTime> errors;
  final Upload upload;

  Sleep({required this.download, required this.errors, required this.upload});

  factory Sleep.fromJson(Map<String, dynamic> json) {
    return Sleep(
      download: Download.fromJson(json["download"]),
      errors: (json["errors"] as List)
          .map((errorJson) => ErrorSleepTime.fromJson(errorJson))
          .toList(),
      upload: Upload.fromJson(json["upload"]),
    );
  }
}

class API {
  final int readTimedoutSeconds;
  final int writeTimedoutSeconds;

  API.fromJson(Map<String, dynamic> json)
    : readTimedoutSeconds = json["readTimedoutSeconds"],
      writeTimedoutSeconds = json["writeTimedoutSeconds"];
}

class Download {
  final int intervalSeconds;
  final int retrySeconds;

  Download.fromJson(Map<String, dynamic> json)
    : intervalSeconds = json["intervalSeconds"],
      retrySeconds = json["retrySeconds"];
}

class ErrorSleepTime {
  final int code;
  final String title;
  final int seconds;

  ErrorSleepTime.fromJson(Map<String, dynamic> json)
    : code = json["code"],
      title = json["title"],
      seconds = json["seconds"];
}

class Upload {
  final int configWaitSeconds;

  Upload.fromJson(Map<String, dynamic> json)
    : configWaitSeconds = json["configWaitSeconds"];
}
