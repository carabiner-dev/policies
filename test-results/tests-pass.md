# Tests Pass

Checks that an attested test run exists for the artifact and that every test in it passed.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `test-results-pass` |
| **Assert mode** | AND |
| **Tenets** | 2 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://in-toto.io/attestation/test-result/v0.1"]
    end
    P["🛡️ Tests Pass"]
    inputs --> P
    P --> P_M{"ALL tenets must pass"}
    P_M --> P_T0["📋 01a<br/>in-toto.io/attestation/test-result/v0.1"]
    P_M --> P_T1["📋 01b<br/>in-toto.io/attestation/test-result/v0.1"]
```

## Tenets

### Tenet: `01a`

**Attestation types:**
- `https://in-toto.io/attestation/test-result/v0.1`

**Evaluation:**
```cel
size(predicates) > 0
```

**On pass:** Attested test run found

**On fail:** No attested test runs found
**Guidance:** Generate a test-run attestation to capture the results of your unit tests

### Tenet: `01b`

**Attestation types:**
- `https://in-toto.io/attestation/test-result/v0.1`

**Evaluation:**
```cel
outputs.result == 'pass' 
```

**Outputs:**
- `result`: `has(predicates[0].data.result) ? predicates[0].data.result : '' `

**On pass:** All attested tests are passing

**On fail:** Some of the attested test runs failed
**Guidance:** Check the output of your unit tests, ensure they are passing

