part of ace;

class Editor {  
  js.Proxy _proxy;
  js.Callback _jsOnBlur;
  js.Callback _jsOnChange;
  js.Callback _jsOnCopy;
  js.Callback _jsOnFocus;
  js.Callback _jsOnPaste;
  
  final _onBlur = new StreamController.broadcast();
  final _onChange = new StreamController<Delta>.broadcast();
  final _onCopy = new StreamController<String>.broadcast();
  final _onFocus = new StreamController.broadcast();
  final _onPaste = new StreamController<String>.broadcast();
  
  Stream get onBlur => _onBlur.stream;
  Stream<Delta> get onChange => _onChange.stream;
  Stream<String> get onCopy => _onCopy.stream;
  Stream get onFocus => _onFocus.stream;
  Stream<String> get onPaste => _onPaste.stream;
  
  EditSession _session;
  EditSession get session {
    if (_session == null) {
      _session = new EditSession._(_proxy.getSession());
    }
    return _session;
  }
  
  String get copyText => _proxy.getCopyText();
  
  int
    get dragDelay => _proxy.getDragDelay();
    set dragDelay(int dragDelay) => _proxy.setDragDelay(dragDelay);
  
  int get firstVisibleRow => _proxy.getFirstVisibleRow();
  
  bool
    get highlightActiveLine => _proxy.getHighlightActiveLine();
    set highlightActiveLine(bool highlightActiveLine) =>
        _proxy.setHighlightActiveLine(highlightActiveLine);
    
  bool
    get highlightGutterLine => _proxy.getHighlightGutterLine();
    set highlightGutterLine(bool highlightGutterLine) =>
        _proxy.setHighlightGutterLine(highlightGutterLine);
    
  bool
    get highlightSelectedWord => _proxy.getHighlightSelectedWord();
    set highlightSelectedWord(bool highlightSelectedWord) =>
        _proxy.setHighlightSelectedWord(highlightSelectedWord);
    
  bool get isFocused => _proxy.isFocused();
  
  bool
    get overwrite => _proxy.getOverwrite();
    set overwrite(bool overwrite) => _proxy.setOverwrite(overwrite);
  
  int
    get printMarginColumn => _proxy.getPrintMarginColumn();
    set printMarginColumn(int printMarginColumn) => 
        _proxy.setPrintMarginColumn(printMarginColumn);
    
  bool
    get readOnly => _proxy.getReadOnly();
    set readOnly(bool readOnly) => _proxy.setReadOnly(readOnly);
  
  int
    get scrollSpeed => _proxy.getScrollSpeed();
    set scrollSpeed(int scrollSpeed) => _proxy.setScrollSpeed(scrollSpeed);
    
  String
    get theme => _proxy.getTheme();
    set theme(String theme) => _proxy.setTheme(theme);
  
  Editor._(js.Proxy proxy) : _proxy = js.retain(proxy) {
    _jsOnBlur = new js.Callback.many((_,__) => _onBlur.add(this));
    _jsOnChange = new js.Callback.many((e,__) {
      Delta delta = new Delta._for(e.data);
      _onChange.add(delta); 
    });
    _jsOnCopy = new js.Callback.many((e,__) => _onCopy.add(e));
    _jsOnFocus = new js.Callback.many((_,__) => _onFocus.add(this));
    _jsOnPaste = new js.Callback.many((e,__) => _onPaste.add(e));
    _proxy.on('blur', _jsOnBlur);
    _proxy.on('change', _jsOnChange);
    _proxy.on('copy', _jsOnCopy);
    _proxy.on('focus', _jsOnFocus);
    _proxy.on('paste', _jsOnPaste);
  }
  
  void dispose() {
    assert(_proxy != null);
    if (_session != null) _session.dispose();
    _onBlur.close();
    _onChange.close();
    _onCopy.close();
    _onFocus.close();
    _onPaste.close();
    _jsOnBlur.dispose();
    _jsOnChange.dispose();
    _jsOnCopy.dispose();
    _jsOnFocus.dispose();
    _jsOnPaste.dispose();
    _proxy.destroy();
    js.release(_proxy);
    _proxy = null;
  }
  
  void alignCursors() => _proxy.alignCursors();
  void blockOutdent() => _proxy.blockOutdent();
  void blur() => _proxy.blur();
  void centerSelection() => _proxy.centerSelection();
  void clearSelection() => _proxy.clearSelection();
  int copyLinesDown() => _proxy.copyLinesDown();
  int copyLinesUp() => _proxy.copyLinesUp();
  void exitMultiSelectMode() => _proxy.exitMultiSelectMode();
  void focus() => _proxy.focus();
  void gotoPageDown() => _proxy.gotoPageDown();
  void gotoPageUp() => _proxy.gotoPageUp();
  void indent() => _proxy.indent();
  void insert(String text) => _proxy.insert(text);
  bool isRowFullyVisible(int row) => _proxy.isRowFullyVisible(row);
  bool isRowVisible(int row) => _proxy.isRowVisible(row);
  void navigateFileEnd() => _proxy.navigateFileEnd();
  void navigateFileStart() => _proxy.navigateFileStart();
  void navigateLeft(int times) => _proxy.navigateLeft(times);
  void navigateLineEnd() => _proxy.navigateLineEnd();
  void navigateLineStart() => _proxy.navigateLineStart();
  void navigateRight(int times) => _proxy.navigateRight(times);
  void navigateTo(int row, int column) => _proxy.navigateTo(row, column);
  void navigateUp(int times) => _proxy.navigateUp(times);
  void navigateWordLeft() => _proxy.navigateWordLeft();
  void navigateWordRight() => _proxy.navigateWordRight();
  void resize(bool force) => _proxy.resize(force);
  void toggleOverwrite() => _proxy.toggleOverwrite();
}