part of ace;

/// Manages the undo stack for an [EditSession].
abstract class UndoManager extends _Disposable {
  
  /// Returns `true` if there are [redo] operations left to perform.
  bool get hasRedo;
  
  /// Returns `true` if there are [undo] operations left to perform.
  bool get hasUndo;
  
  /// Called internally when the given [deltas] have been executed.
  /// 
  /// It is an error to call this method from outside this library.
  void onExecuted(List<UndoManagerDelta> deltas, bool merge);
  
  /// Performs a redo operation on the associated document, reapplying the last 
  /// change.
  /// 
  /// If [select] is _false_ then the range of the change will not be selected.  
  /// 
  /// Returns the range of the operation that is performed, or `null` if 
  /// [hasRedo] is _false_.
  Range redo({bool select: true});
  
  /// Destroys the stack of [undo] and [redo] operations.
  void reset();
  
  /// Performs an undo operation on the associated document, reverting the last 
  /// change.
  /// 
  /// If [select] is _false_ then the range of the change will not be selected.  
  /// 
  /// Returns the range of the operation that is performed, or `null` if 
  /// [hasUndo] is _false_.
  Range undo({bool select: true});
}

/// A base class for implementing [UndoManager].
/// 
/// When setting [EditSession.undoManager] the argument _must_ be an object
/// derived from this class.
abstract class UndoManagerBase extends _HasReverseProxy implements UndoManager {
  
  EditSession _session;
  /// The [EditSession] whose undo stack this undo manager manages; may be 
  /// `null` until the first call to [UndoManager.onExecuted].
  EditSession get session => _session;
  
  UndoManagerBase() {
    _proxy['execute'] = new js.JsFunction.withThis((_, options) {
      if (_session == null) {
        _session = new _EditSessionProxy._(options['args'][1]);
      }   
      List<UndoManagerDelta> deltas =_list(options['args'][0]).map((proxy) => 
          new UndoManagerDelta._fromProxy(proxy)).toList(growable: false);      
      bool merge = options['merge'];
      onExecuted(deltas, merge);
    });
    _proxy['hasRedo'] = new js.JsFunction.withThis((_) => hasRedo);
    _proxy['hasUndo'] = new js.JsFunction.withThis((_) => hasUndo);    
    _proxy['redo'] = new js.JsFunction.withThis((_,[bool dontSelect = false]) => 
        redo(select: !dontSelect));
    _proxy['reset'] = new js.JsFunction.withThis((_) => reset());
    _proxy['undo'] = new js.JsFunction.withThis((_,[bool dontSelect = false]) => 
        undo(select: !dontSelect)); 
  }
  
  void _onDispose() {
    _proxy.deleteProperty('execute');
    _proxy.deleteProperty('hasRedo');
    _proxy.deleteProperty('hasUndo');    
    _proxy.deleteProperty('redo');
    _proxy.deleteProperty('reset');
    _proxy.deleteProperty('undo');
  }
}

class UndoManagerDelta {

  final String group;
  
  final List<Delta> deltas;
  
  UndoManagerDelta._(this.group, this.deltas);
  
  UndoManagerDelta._fromProxy(proxy) : this._(
      proxy['group'],
      proxy['deltas'].map((delta) => 
          new Delta._forProxy(delta)).toList(growable: false));
}
