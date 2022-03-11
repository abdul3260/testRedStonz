final String tableHistory = "History";

class HistoryFields {
  static final List<String> value = [
    id,
    dateAndTime,
    ipAddress,
    deviceName,
    screenResolution,
    deviceOperatingSystem,
  ];

  static final String id = "_id";
  static final String dateAndTime = "dateAndTime";
  static final String ipAddress = "ipAddress";
  static final String deviceName = "deviceName";
  static final String screenResolution = "screenResolution";
  static final String deviceOperatingSystem = "deviceOperatingSystem";
}

class History {
  final int? id;
  final String dateAndTime;
  final String ipAddress;
  final String deviceName;
  final String screenResolution;
  final String deviceOperatingSystem;

  History({
    this.id,
    required this.dateAndTime,
    required this.ipAddress,
    required this.deviceName,
    required this.screenResolution,
    required this.deviceOperatingSystem,
  });
  History copy({
    int? id,
    String? dateAndTime,
    String? ipAddress,
    String? deviceName,
    String? screenResolution,
    String? deviceOperatingSystem,
  }) =>
      History(
        id: id ?? this.id,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        deviceName: deviceName ?? this.deviceName,
        deviceOperatingSystem: deviceOperatingSystem ?? this.deviceOperatingSystem,
        ipAddress: ipAddress ?? this.ipAddress,
        screenResolution: screenResolution ?? this.screenResolution,
      );

  Map<String, Object?> toJson() => {
        HistoryFields.id: id,
        HistoryFields.dateAndTime: dateAndTime,
        HistoryFields.ipAddress: ipAddress,
        HistoryFields.deviceName: deviceName,
        HistoryFields.screenResolution: screenResolution,
        HistoryFields.deviceOperatingSystem: deviceOperatingSystem,
      };
  static History fromJson(Map<String, Object?> json) => History(
    //TODO: error here
        id: json[HistoryFields.id] as int?,
        dateAndTime: json[HistoryFields.dateAndTime] as String,
        ipAddress: json[HistoryFields.ipAddress] as String,
        deviceName: json[HistoryFields.deviceName] as String,
        screenResolution: json[HistoryFields.screenResolution] as String,
        deviceOperatingSystem: json[HistoryFields.deviceOperatingSystem] as String,
      );
}
