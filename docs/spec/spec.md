# Specification: Ballerina Random Library

_Owners_: @daneshk @MadhukaHarith92  
_Reviewers_: @daneshk  
_Created_: 2021/11/09  
_Updated_: 2022/02/08  
_Edition_: Swan Lake
_Issue_: [#2328](https://github.com/ballerina-platform/ballerina-standard-library/issues/2328)

# Introduction
This is the specification for the Random standard library of [Ballerina language](https://ballerina.io/), which provides APIs to generate pseudo-random numbers.

The Random library specification has evolved and may continue to evolve in the future. Released versions of the specification can be found under the relevant Github tag.

If you have any feedback or suggestions about the library, start a discussion via a [Github issue](https://github.com/ballerina-platform/ballerina-standard-library/issues) or in the [Slack channel](https://ballerina.io/community/). Based on the outcome of the discussion, specification and implementation can be updated. Community feedback is always welcome. Any accepted proposal which affects the specification is stored under `/docs/proposals`. Proposals under discussion can be found with the label `type/proposal` in Github.

Conforming implementation of the specification is released and included in the distribution. Any deviation from the specification is considered a bug.

# Contents

1. [Overview](#1-overview)
2. [Random Number Generation](#2-random-number-generation)

## 1. Overview
This specification elaborates on the random number generation functions available in the Random library.

## 2. Random number generation
A random decimal number between 0.0 and 1.0 can be generated using the `random:createDecimal()` function.
```ballerina
float randomValue = random:createDecimal();
```

A random integer between the given start(inclusive) and end(exclusive) values can be generated using the `random:createIntInRange()` function.
```ballerina
int randomInteger = check random:createIntInRange(1, 100);
```

