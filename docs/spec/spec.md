# Specification: Ballerina Random Library

_Owners_: @daneshk @MadhukaHarith92  
_Reviewers_: @daneshk  
_Created_: 2021/11/09  
_Updated_: 2021/11/09  
_Issue_: [#2328](https://github.com/ballerina-platform/ballerina-standard-library/issues/2328)

# Introduction
The Random library is used to generate pseudo-random numbers. It is part of Ballerina Standard Library. [Ballerina programming language](https://ballerina.io/) is an open-source programming language for the cloud that makes it easier to use, combine, and create network services.

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

