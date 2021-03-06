library expect_multi_parts;

import 'package:unittest/unittest.dart';
import 'scratch_remove_me/lib/two_parts.dart';
// custom <additional imports>
// end <additional imports>


// custom <library expect_multi_parts>

main() {

  test('multi-parts public var found in main library found', 
      () => expect(lV1Public, 4));
  test('multi-parts p1V1 found', 
      () => expect(p1V1, 3));
  test('multi-parts p1V2 found', 
      () => expect(p1V2, 4));
  test('multi-parts p2V1 found', 
      () => expect(p2V1, 'goo'));

  test('multi-parts class P1C1 found', 
      () => expect(new P1C1() is P1C1, true));
  test('multi-parts class P1C2 found', 
      () => expect(new P1C2() is P1C2, true));
  test('multi-parts class P2C1 found', 
      () => expect(new P2C1() is P2C1, true));
  test('multi-parts class P2C2 found', 
      () => expect(new P2C2() is P2C2, true));

}

// end <library expect_multi_parts>

