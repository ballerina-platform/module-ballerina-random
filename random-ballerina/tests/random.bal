// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

@test:Config {}
isolated function randomTest () {
    float result = random();
    test:assertTrue(result > 0 && result < 1, msg = "randomTest result is not between 0 and 1");
}

@test:Config {}
isolated function randomInRangeTest() {
    int|error result = randomInRange(5, 10);
    if (result is int) {
        test:assertTrue(result >= 5 && result < 10, msg = "randomInRangeTest result is not within 5 and 10");
    } else {
        test:assertFail("randomInRangeTest result is not int");
    }
}
