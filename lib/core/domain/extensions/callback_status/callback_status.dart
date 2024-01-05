enum CallbackStatus {
  initial,
  success,
  error,
  loading,
  loaded
}

extension CallbackStatusX on CallbackStatus {
  bool get isInitial => this == CallbackStatus.initial;
  bool get isSuccess => this == CallbackStatus.success;
  bool get isError => this == CallbackStatus.error;
  bool get isLoading => this == CallbackStatus.loading;
  bool get isLoaded => this == CallbackStatus.loaded;
}

enum CampaignListApiCallStatus {
  initial,
  inProgress,
  success,
  error,
}

extension CampaignListApiCallStatusX on CampaignListApiCallStatus {
  bool get isInitial => this == CampaignListApiCallStatus.initial;
  bool get isInProgress => this == CampaignListApiCallStatus.inProgress;
  bool get isSuccess => this == CampaignListApiCallStatus.success;
  bool get isError => this == CampaignListApiCallStatus.error;
}

enum GoingStatus {
  initial,
  success,
  error,
}

extension GoingStatusX on GoingStatus {
  bool get isInitial => this == GoingStatus.initial;
  bool get isSuccess => this == GoingStatus.success;
  bool get isError => this == GoingStatus.error;
}
