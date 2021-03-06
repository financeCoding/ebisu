library test_functions;

import 'package:ebisu/ebisu.dart';
import 'package:unittest/unittest.dart';
// custom <additional imports>
// end <additional imports>


// custom <library test_functions>
// end <library test_functions>

main() { 
// custom <main>

  test('chomp removes one trailing newline', () =>
      expect(chomp("test\n\n"), "test\n"));

  test('chomp can remove multiple new lines', () =>
      expect(chomp("test\n\n\n", true), "test"));

  test('indentBlock indents a block, 2 space default', () =>
      expect(indentBlock('''
class C {
  int x;
}
'''),
          '''
  class C {
    int x;
  }
'''));

  test('indentBlock can indent block 4 spaces', () =>
      expect(indentBlock('''
class C {
  int x;
}
''', '    '),
          '''
    class C {
      int x;
    }
'''));

  test('prepJoin adds suffix to all but last', () =>
      expect(prepJoin(['a','b','c']).toString(),
          ['a,', 'b,', 'c'].toString()));

  test('formatFill joins with spaces by default', () =>
      expect(formatFill(['a', 'b', 'c']), 'a b c'));

  test('formatFill joins with what you want', () =>
      expect(formatFill(['a', 'b', 'c'], sep : ','), 'a,b,c'));

  test('formatFill breaks up long lines', () =>
      expect(formatFill([
        'void foo(', 
        'GobbledeeGook fingerPaint,',
        'SpookyCooky fenderBender,',
        'GlobalThermoNuclearWar ww3',
        ')'
      ]), '''void foo( GobbledeeGook fingerPaint, SpookyCooky fenderBender,
  GlobalThermoNuclearWar ww3 )'''));

  test('formatFill breaks up long lines', () =>
      expect(formatFill([
        'void foo(Ding ding,', 
        'GobbledeeGook fingerPaint,',
        'SpookyCooky fenderBender,',
        'GlobalThermoNuclearWar ww3)',
      ]), '''
void foo(Ding ding, GobbledeeGook fingerPaint, SpookyCooky fenderBender,
  GlobalThermoNuclearWar ww3)'''));

  test('codeEquivalent ignores space', () =>
      expect(
        codeEquivalent('class C { int x; }',
            'class C {\nint x;\n}'), true));

  test('codeEquivalent returns false on mismatch', () =>
      expect(
        codeEquivalent('class C { int x; }',
            'Klass C {\nint x;\n}'), false));

  {
    const first = '''
class C {
   // this is a code smell
   int x;
}
''';
  
    const second = '''
class C {
   // this is good stuff
   int x;
}
''';

    test('codeEquivalent includes line comments', () =>
        expect(codeEquivalent(first, second), false));

    test('codeEquivalent can ignore line comments', () =>
        expect(codeEquivalent(first, second, stripComments:true), 
            true));
  }

  {
    const first =  '''
class C {
   /* 
     this is a code smell
    */
   int x;
}
''';

    const second = '''
class C {
   /* this is 
      good stuff */
   int x;
}
''';

    test('codeEquivalent includes block comments', () =>
        expect(codeEquivalent(first, second), false));

    test('codeEquivalent can ignore block comments', () =>
        expect(codeEquivalent(first, second, stripComments:true), 
            true));
  }

// end <main>

}
