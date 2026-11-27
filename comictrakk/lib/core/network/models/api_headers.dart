class ApiHeaders {

  int sustainedRemaining;
  int sustainedReset;
  int sustainedLimit;

  int burstRemaining;
  int burstReset;
  int burstLimit;

  ApiHeaders({required this.sustainedRemaining, required this.sustainedReset, required this.sustainedLimit,
              required this.burstRemaining, required this.burstReset, required this.burstLimit});

  factory ApiHeaders.fromMap(Map<String, String> headerMap) {
    return ApiHeaders(
        sustainedRemaining: int.parse(headerMap["x-ratelimit-sustained-remaining"]!),
        sustainedReset: int.parse(headerMap["x-ratelimit-sustained-reset"]!),
        sustainedLimit: int.parse(headerMap["x-ratelimit-sustained-limit"]!),
        burstRemaining: int.parse(headerMap["x-ratelimit-burst-remaining"]!),
        burstReset: int.parse(headerMap["x-ratelimit-burst-reset"]!),
        burstLimit: int.parse(headerMap["x-ratelimit-burst-limit"]!)
    );
  }
}