# Specification: Ballerina Random Library

_Owners_: @daneshk @MadhukaHarith92  
_Reviewers_: @daneshk  
_Created_: 2021/11/09  
_Updated_: 2021/11/09  
_Issue_: [#2328](https://github.com/ballerina-platform/ballerina-standard-library/issues/2328)

# Introduction
This is the specification for the Random standard library which is used to generate pseudo-random numbers programmed in the
[Ballerina programming language](https://ballerina.io/), which is an open-source programming language for the cloud
that makes it easier to use, combine, and create network services.

# Contents

1. [Overview](#1-overview)
2. [Random number generation](#2-random-number-generation)

## 1. Overview
This specification elaborates on random number generation.

## 2. Random number generation
A random decimal number between 0.0 and 1.0 can be generated using the `random:createDecimal()` function as follows.
```ballerina
float randomValue = random:createDecimal();
```

A random integer between the given start(inclusive) and end(exclusive) values can be generated using the `random:createIntInRange()` function as follows.
```ballerina
int randomInteger = check random:createIntInRange(1, 100);
```

