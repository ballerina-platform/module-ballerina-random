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

import ballerina/time;
import ballerina/jballerina.java;

const decimal a = 25214903917;
const decimal c = 17;
final decimal & readonly m = <decimal>float:pow(2, 48);
isolated decimal x0 = currentTimeInMilliSeconds();

# Generates a random decimal number between 0.0 and 1.0.
# ```ballerina
# float randomValue = random:createDecimal();
# ```
#
# + return - Selected random value
public isolated function createDecimal() returns float {
    return nextFloat();
}

# Generates a random number between the given start(inclusive) and end(exclusive) values.
# Please note that the generated number is not cryptographically secured.
# ```ballerina
# int randomInteger = check random:createIntInRange(1, 100);
# ```
#
# + startRange - Range start value
# + endRange - Range end value
# + return - Selected random value or else, a `random:Error` if the start range is greater than the end range
public isolated function createIntInRange(int startRange, int endRange) returns int|Error {
    if startRange >= endRange {
        return error Error("End range value must be greater than the start range value");
    }
    
    int range = endRange - startRange;
    if (range == int:MAX_VALUE) {
       
        return error Error("Full int range is requested.");
    }
    
    // Generate a random number within the range.
    int randomValue = randomInt(range);
    
    // Add the random value to the start range to get the final result.
    int result = startRange + randomValue;
    
    return result;
}

function randomInt(int range) returns int {
    // Use a suitable random number generator function.
    // You can replace this with the random generator you prefer.
    return check random:createIntInRange(0, range);
}


isolated function lcg() returns decimal {
    decimal x1;
    lock {
        x1 = (a * x0 + c) % m;
        x0 = x1;
    }
    return x1;
}

isolated function currentTimeInMilliSeconds() returns decimal {
    time:Utc utc = time:utcNow();
    decimal mills = <decimal>(utc[0] * 1000) + utc[1] * 1000;
    return decimal:round(mills);
}

isolated function nextFloat() returns float {
    handle secureRandomObj = newSecureRandom();
    return nextFloatExtern(secureRandomObj);
}

isolated function newSecureRandom() returns handle = @java:Constructor {
    'class: "java.security.SecureRandom"
} external;

isolated function nextFloatExtern(handle secureRandomObj) returns float = @java:Method {
    name: "nextFloat",
    'class: "java.security.SecureRandom"
} external;
