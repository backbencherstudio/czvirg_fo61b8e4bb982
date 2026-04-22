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

final List<VideoResourceModel> videoResources = [
  VideoResourceModel(
    title: "First Video",
    subtitle: "Introduction to the topic",
    youtubeUrl: "https://www.youtube.com/watch?v=vKWE2GjZwww",
    videoId: "vKWE2GjZwww",
    timesWatched: 3,
    lastWatchedDate: "2026-04-20",
  ),
  VideoResourceModel(
    title: "Second Video",
    subtitle: "Deep dive explanation",
    youtubeUrl: "https://www.youtube.com/watch?v=rDrUqwCBsxY",
    videoId: "rDrUqwCBsxY",
    timesWatched: 1,
    lastWatchedDate: "2026-04-18",
  ),
  VideoResourceModel(
    title: "Third Video",
    subtitle: "Practical examples",
    youtubeUrl: "https://www.youtube.com/watch?v=Ho63YbzWhwg",
    videoId: "Ho63YbzWhwg",
    timesWatched: 2,
    lastWatchedDate: "2026-04-15",
  ),
  VideoResourceModel(
    title: "Fourth Video",
    subtitle: "Advanced concepts",
    youtubeUrl: "https://www.youtube.com/watch?v=TNE4WeaUCrY",
    videoId: "TNE4WeaUCrY",
    timesWatched: 4,
    lastWatchedDate: "2026-04-10",
  ),
  VideoResourceModel(
    title: "Fifth Video",
    subtitle: "Playlist continuation",
    youtubeUrl: "https://www.youtube.com/watch?v=uTE5irUj0xs&list=PLI8EKy28Uo30ZLbRSaoyudieUd-GxpaEx&index=3&t=5s",
    videoId: "uTE5irUj0xs",
    timesWatched: 1,
    lastWatchedDate: "2026-04-08",
  ),
  VideoResourceModel(
    title: "Sixth Video",
    subtitle: "More detailed walkthrough",
    youtubeUrl: "https://www.youtube.com/watch?v=UIozBJdijJ0&list=PLI8EKy28Uo30ZLbRSaoyudieUd-GxpaEx&index=3&t=25s",
    videoId: "UIozBJdijJ0",
    timesWatched: 2,
    lastWatchedDate: "2026-04-05",
  ),
  VideoResourceModel(
    title: "Seventh Video",
    subtitle: "Final part of series",
    youtubeUrl: "https://www.youtube.com/watch?v=C_b4NEDSwGU&list=PLI8EKy28Uo30ZLbRSaoyudieUd-GxpaEx&index=4&t=43s",
    videoId: "C_b4NEDSwGU",
    timesWatched: 5,
    lastWatchedDate: "2026-04-01",
  ),
];