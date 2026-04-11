class VideoResourceModel {
  final String title;
  final String subtitle;
  final String youtubeUrl;
  final String videoId;
  final int timesWatched;
  final String lastWatchedDate;

  VideoResourceModel({
    required this.title,
    required this.subtitle,
    required this.youtubeUrl,
    required this.videoId,
    required this.timesWatched,
    required this.lastWatchedDate,
  });
}