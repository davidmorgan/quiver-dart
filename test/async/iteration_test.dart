// Copyright 2013 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library quiver.async.iteration_test;

import 'dart:async';

import 'package:unittest/unittest.dart';
import 'package:quiver/async.dart';

main() {

  group('doWhileAsync', () {

    test('should process the entier iterable if action returns true', () {
      var items = [];
      return doWhileAsync([1, 2, 3], (e) {
        items.add(e);
        return new Future(() => true);
      }).then((r) {
        expect(items, [1, 2, 3]);
        expect(r, true);
      });
    });

    test('should process the entier iterable until action returns false', () {
      var items = [];
      return doWhileAsync([1, 2, 3], (e) {
        items.add(e);
        return new Future(() => e < 2);
      }).then((r) {
        expect(items, [1, 2]);
        expect(r, false);
      });
    });

  });

  group('reduceAsync', () {

    test('should reduce iterable', () {
      var items = [];
      return reduceAsync([1, 2, 3], 0, (v, e) {
        items.add(e);
        return new Future(() => v + e);
      }).then((r) {
        expect(items, [1, 2, 3]);
        expect(r, 6);
      });
    });

  });
}
