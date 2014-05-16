library ace.example.basic;

import 'dart:html';
import 'dart:async';
import 'package:ace/ace.dart' as ace;
import 'package:ace/proxy.dart';

main() {
  ace.implementation = ACE_PROXY_IMPLEMENTATION;
  ace.require('ace/ext/linking');

  var editor = ace.edit(querySelector('#editor'))
  ..theme = new ace.Theme('ace/theme/monokai')
  ..session.mode = new ace.Mode('ace/mode/dart');

  editor.setOptions({
        'enableMultiselect' : false,
        'enableLinking' : true
      });

  new Future.delayed(const Duration(milliseconds: 2000)).then((_){
    /*%TRACE3*/ print("(4> 5/16/14): Future.delayed!"); // TRACE%

    editor.onLinkClick.listen((ace.Point documentPoint) {
      /*%*/ print("Link: ${documentPoint.column}, ${documentPoint.row}"); //%
    });
    editor.onLinkHover.listen((ace.Point documentPoint) {
      /*%*/ print("hover: ${documentPoint.column}, ${documentPoint.row}"); //%
      editor.session.addMarker(new ace.Range(documentPoint.row, documentPoint.column, documentPoint.row, documentPoint.column + 2), "ace_bracket", type: ace.Marker.TEXT);
    });

  });
}
