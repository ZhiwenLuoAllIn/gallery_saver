const List<String> videoFormats = [
  '.mp4',
  '.mov',
  '.avi',
  '.wmv',
  '.3gp',
  '.3gpp',
  '.mkv',
  '.flv'
];
const List<String> imageFormats = [
  '.jpeg',
  '.png',
  '.jpg',
  '.gif',
  '.webp',
  '.tif',
  '.heic'
];
const http = 'http';

bool isLocalFilePath(String path) {
  Uri uri = Uri.parse(path);
  return !uri.scheme.contains(http);
}

bool containVideoSuffix(String path) {
  bool output = false;
  videoFormats.forEach((videoFormat) {
    if (path.toLowerCase().contains(videoFormat)) output = true;
  });
  return output;
}

bool containImageSuffix(String path) {
  bool output = false;
  imageFormats.forEach((imageFormat) {
    if (path.toLowerCase().contains(imageFormat)) output = true;
  });
  return output;
}

Map<String, String> contentTypeToExtension = {
  "image/jpeg": "jpg",
  "image/png": "png",
  "image/gif": "gif",
  "image/bmp": "bmp",
  "image/webp": "webp",
  "video/mp4": "mp4",
  "video/mpeg": "mpeg",
  "video/ogg": "ogv",
  "video/webm": "webm",
  "audio/mpeg": "mp3",
  "audio/ogg": "oga",
  "audio/wav": "wav",
  "audio/webm": "weba",
  "application/pdf": "pdf",
  "application/msword": "doc",
  "application/vnd.ms-excel": "xls",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
      "docx",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": "xlsx",
  // Add more content types and extensions as needed
};

String getFileSuffix(String contentType) {
  final String? exsitSuffix = contentTypeToExtension[contentType.toLowerCase()];
  if (exsitSuffix == null) {
    if (contentType.contains('image')) {
      return 'jpg';
    } else if (contentType.contains('video')) {
      return 'mp4';
    }
    return '';
  }
  return exsitSuffix;
}
