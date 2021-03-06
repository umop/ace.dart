part of ace;

class SearchOptions {
  
  /// The string or regular expression you are looking for.
  final String needle;
  
  /// Whether to search backwards from where the cursor currently is; defaults 
  /// to `false`.
  final bool backwards;
  
  /// Whether the search is case-sensitive; defaults to `false`.
  final bool caseSensitive;
  
  /// The [Range] to search within. Set this to `null` for the whole document.
  final Range range;
  
  /// Whether the search is a regular expression or not; defaults to `false`.
  final bool regExp;
  
  /// Whether or not to include the current line in the search; defaults to 
  /// `false`.
  final bool skipCurrent;
  
  /// The starting [Range] to begin the search.
  final Range start;
  
  /// Whether the search matches only on whole words; defaults to `false`.
  final bool wholeWord;
  
  /// Whether to wrap the search back to the beginning when it hits the end; 
  /// defaults to `false`.
  final bool wrap;
  
  SearchOptions({this.backwards: false,
                 this.caseSensitive: false,
                 this.needle: '',
                 this.range,
                 this.regExp: false,
                 this.skipCurrent: false,
                 this.start,
                 this.wholeWord: false,
                 this.wrap: false});  
  
  SearchOptions._(proxy) : this(
      backwards: proxy['backwards'] == null ? false : proxy['backwards'],
      caseSensitive: proxy['caseSensitive'] == null ? false 
          : proxy['caseSensitive'],
      needle: proxy['needle'] == null ? '' : proxy['needle'],
      range: proxy['range'] == null ? null : new Range._(proxy['range']),
      regExp: proxy['regExp'] == null ? false : proxy['regExp'],
      skipCurrent: proxy['skipCurrent'] == null ? false : proxy['skipCurrent'],
      start: proxy['start'] == null ? null : new Range._(proxy['start']),
      wholeWord: proxy['wholeWord'] == null ? false : proxy['wholeWord'],
      wrap: proxy['wrap'] == null ? false : proxy['wrap']);
  
  js.JsObject _toProxy() =>
      _jsMap({ 
        'backwards': backwards,
        'caseSensitive': caseSensitive,
        'needle': needle,
        'range': range == null ? null : range._toProxy(),
        'regExp': regExp,
        'skipCurrent': skipCurrent,
        'start': start == null ? null : start._toProxy(),
        'wholeWord': wholeWord,
        'wrap': wrap });
}

/// Handles text searches within a [Document].
abstract class Search extends _Disposable {
  
  /// The current [SearchOptions].
  SearchOptions options;
  
  /// Creates a new Search with default [SearchOptions]. 
  factory Search() => new _SearchProxy();
  
  /// Searches for [options.needle] in the given [session]. 
  /// 
  /// If the [options.needle] is found, this method returns the [Range] where 
  /// the text first occurs.  Otherwise, it returns `null`.
  /// 
  /// If [options.backwards] is `true`, the search goes backwards in the 
  /// [session].
  Range find(EditSession session);
  
  /// Searches for all occurrences  of [options.needle] in the given [session]. 
  /// 
  /// This method returns a [Range] iterable of all the text occurrences that
  /// match the [options].  If the [options.needle] is not found, the iterable
  /// will be empty.
  /// 
  /// If [options.backwards] is `true`, the search goes backwards in the 
  /// [session].
  Iterable<Range> findAll(EditSession session);
}
