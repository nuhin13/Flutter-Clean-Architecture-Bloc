extension StringUtil on String {
  String trimCharLeft(String pattern) {
    if ((this).isEmpty || (pattern).isEmpty || pattern.length > length) {
      return this;
    }

    String r = this;
    while (r.startsWith(pattern)) {
      r = r.substring(pattern.length);
    }
    return r;
  }

  String trimCharRight(String pattern) {
    if ((this).isEmpty || (pattern).isEmpty || pattern.length > length) {
      return this;
    }

    String r = this;
    while (r.endsWith(pattern)) {
      r = r.substring(0, r.length - pattern.length);
    }
    return r;
  }

  String trimChar(String pattern) {
    return trimCharLeft(pattern).trimCharRight(pattern);
  }

  String reverse() {
    return split('').reversed.join();
  }

  String insertCharAt(String char, int position) {
    String s = this;
    if (s.length < position) {
      return s;
    }
    var before = s.substring(0, position);
    var after = s.substring(position, s.length);
    return before + char + after;
  }

  String lastWord() {
    String s = trim();
    List<String> words = s.split(" ");
    return words[words.length - 1];
  }
}
