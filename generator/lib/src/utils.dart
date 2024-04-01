String camelCaseToLowerUnderscore(String s) {
  var sb = StringBuffer();
  var first = true;
  for (var rune in s.runes) {
    var char = String.fromCharCode(rune);
    if (isUpperCase(char) && !first) {
      if (char != '_') {
        sb.write('_');
      }
      sb.write(char.toLowerCase());
    } else {
      first = false;
      sb.write(char.toLowerCase());
    }
  }
  return sb.toString();
}

///
/// Checks if the given string [s] is lower case
///
bool isLowerCase(String s) {
  return s == s.toLowerCase();
}

///
/// Checks if the given string [s] is upper case
///
bool isUpperCase(String s) {
  return s == s.toUpperCase();
}
