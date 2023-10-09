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
isolated function createDecimalTest() {
    float result = createDecimal();
    test:assertTrue(result > 0.0 && result < 1.0, msg = "createDecimalTest result is not between 0 and 1");
}

@test:Config {}
isolated function createIntInRangeTest() {
    int|error result = createIntInRange(5, 10);
    if result is int {
        test:assertTrue(result >= 5 && result < 10, msg = "createIntInRangeTest result is not within 5 and 10");
    } else {
        test:assertFail("createIntInRangeTest result is not int");
    }
}

@test:Config {}
isolated function createIntInRangeWithSingleElementTest() {
    final int someInt = 123;
    int|error result = createIntInRange(someInt, someInt + 1);
    if result is int {
        test:assertTrue(result == someInt, msg = "createIntInRangeWithSingleElementTest result is not " + someInt.toString());
    } else {
        test:assertFail("createIntInRangeTest result is not int");
    }
}

@test:Config {}
isolated function negativeTestforCreateIntInRangeTest() {
    int|error result = createIntInRange(5000, 10);
    if result is error {
        test:assertTrue(result.message().includes("End range value must be greater than the start range value"),
                    msg = "negativeTestforCreateIntInRangeTest result incorrect");
    } else {
        test:assertFail("Result is not mismatch");
    }
}

@test:Config {}
isolated function negativeTestforCreateIntInRange2Test() {
    int|error result = createIntInRange(17, 17);
    if result is error {
        test:assertTrue(result.message().includes("End range value must be greater than the start range value"),
                    msg = "negativeTestforCreateIntInRange2Test result incorrect");
    } else {
        test:assertFail("Result is not mismatch");
    }
}

@test:Config {}
isolated function doesNotThrowForFullIntRangeTest() {
    int|error result = createIntInRange(int:MIN_VALUE, int:MAX_VALUE);
    if result is int {
        test:assertTrue(result >= int:MIN_VALUE && result < int:MAX_VALUE,
                    msg = "createIntInRangeTest result is not within 5 and 10");
    } else {
        test:assertFail("createIntInRangeTest result is not int");
    }
}

@test:Config {}
isolated function doesNotThrowForAlmostFullIntRangeRTest() {
    int|error result = createIntInRange(int:MIN_VALUE + 1, int:MAX_VALUE);
    if result is int {
        test:assertTrue(result >= int:MIN_VALUE + 1 && result < int:MAX_VALUE,
                    msg = "createIntInRangeTest result is not within 5 and 10");
    } else {
        test:assertFail("createIntInRangeTest result is not int");
    }
}

@test:Config {}
isolated function doesNotThrowForAlmostFullIntRangeLTest() {
    int|error result = createIntInRange(int:MIN_VALUE, int:MAX_VALUE - 1);
    if result is int {
        test:assertTrue(result >= int:MIN_VALUE && result < int:MAX_VALUE - 1,
                    msg = "createIntInRangeTest result is not within 5 and 10");
    } else {
        test:assertFail("createIntInRangeTest result is not int");
    }
}
