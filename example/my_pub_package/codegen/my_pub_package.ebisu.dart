import "dart:io";
import "package:path/path.dart" as path;
import "package:ebisu/ebisu_dart_meta.dart";
import "package:logging/logging.dart";

String _topDir;

void main() {

  //////////////////////////////////////////////////////////////////////
  // Uncomment following for logging
  // Logger.root.onRecord.listen((LogRecord r) =>
  //     print("${r.loggerName} [${r.level}]:\t${r.message}"));

  var here = path.absolute(new Options().script);
  var topDir = path.dirname(path.dirname(here));
  System myPubPackage = system('my_pub_package')
    .. doc = '''
Simple example pub package composed of:
- A self-contained top level library with multiple classes and library variables
- A top level library with two parts and multiple classes
- Hop support
'''
    ..rootPath = topDir
    ..libraries = [
      library('self_contained')
      ..classes = [
        class_('address')
        ..jsonSupport = true
        ..doc = 'An address composed of zip, street and street number'
        ..members = [
          member('zip'),                         // Default type is String
          member('street'),
          member('street_number')..type = 'int',
        ],
        class_('address_book')
        ..jsonSupport = true
        ..members = [
          member('book')
          ..type = 'Map<String,Address>'
          ..classInit = '{}',
        ]
      ],
      library('multi_part')
      ..variables = [
        variable('global_var_1')
        ..type = 'List<String>'
        ..isConst = true
        ..init = '["foo", "bar", "goo"]'
      ]
      ..parts = [
        part('first_part')
        ..classes = [
          class_('c_1_1')
          ..members = [ 
            member('m1'),
            member('m2')
          ],
          class_('c_1_2')
          ..members = [
            member('m1')..type = 'double',
            member('m2')..type = 'dynamic',
          ]
        ],
        part('second_part')
        ..classes = [
          class_('c_2_1')
          ..members = [ 
            member('m1'),
            member('m2')
          ],
          class_('c_2_2')
          ..members = [
            member('m1')..type = 'double',
            member('m2')..type = 'dynamic',
          ]
        ]
      ]
    ];
  
  myPubPackage.generate();
        
}