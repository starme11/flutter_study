class Data {
  final Map<String, dynamic> data;

  Data({required this.data});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(data: json["data"]);
  }

  Map<String, dynamic> toJson() => {"data": data};
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

  Map<String, dynamic> toJson() => {
    "base-url": baseUrl,
    "sleep": sleep.toJson(),
    "api": api.toJson(),
  };
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

  Map<String, dynamic> toJson() => {
    "download": download.toJson(),
    "errors": errors.map((error) => error.toJson()).toList(),
    "upload": upload.toJson(),
  };
}

class API {
  final int readTimedoutSeconds;
  final int writeTimedoutSeconds;

  API({required this.readTimedoutSeconds, required this.writeTimedoutSeconds});

  factory API.fromJson(Map<String, dynamic> json) {
    return API(
      readTimedoutSeconds: json["readTimedoutSeconds"],
      writeTimedoutSeconds: json["writeTimedoutSeconds"],
    );
  }

  Map<String, dynamic> toJson() => {
    "readTimedoutSeconds": readTimedoutSeconds,
    "writeTimedoutSeconds": writeTimedoutSeconds,
  };
}

class Download {
  final int intervalSeconds;
  final int retrySeconds;

  Download({required this.intervalSeconds, required this.retrySeconds});

  factory Download.fromJson(Map<String, dynamic> json) {
    return Download(
      intervalSeconds: json["intervalSeconds"],
      retrySeconds: json["retrySeconds"],
    );
  }

  Map<String, dynamic> toJson() => {
    "intervalSeconds": intervalSeconds,
    "retrySeconds": retrySeconds,
  };
}

class ErrorSleepTime {
  final int code;
  final String title;
  final int seconds;

  ErrorSleepTime({
    required this.code,
    required this.title,
    required this.seconds,
  });

  factory ErrorSleepTime.fromJson(Map<String, dynamic> json) {
    return ErrorSleepTime(
      code: json["code"],
      title: json["title"],
      seconds: json["seconds"],
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
    "seconds": seconds,
  };
}

class Upload {
  final int configWaitSeconds;

  Upload({required this.configWaitSeconds});

  factory Upload.fromJson(Map<String, dynamic> json) {
    return Upload(configWaitSeconds: json["configWaitSeconds"]);
  }

  Map<String, dynamic> toJson() => {"configWaitSeconds": configWaitSeconds};
}
