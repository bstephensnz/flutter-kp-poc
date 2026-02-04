class HidInputEvent {
  final DateTime timestamp;
  final String? logicalKeyLabel;
  final int? logicalKeyId;
  final int? physicalKeyUsbHidUsage;
  final String platform;
  final bool isRepeat;

  const HidInputEvent({
    required this.timestamp,
    this.logicalKeyLabel,
    this.logicalKeyId,
    this.physicalKeyUsbHidUsage,
    required this.platform,
    this.isRepeat = false,
  });

  @override
  String toString() {
    return 'HidInputEvent(time: $timestamp, key: $logicalKeyLabel ($logicalKeyId), phys: $physicalKeyUsbHidUsage)';
  }
}
