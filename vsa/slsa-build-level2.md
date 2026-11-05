# SLSA Build Level 2 Verified

Checks that a SLSA Verification Summary Attestation records a passed verification at SLSA Build Level 2 or higher.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `slsa-build-level-2` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://slsa.dev/verification_summary/v1"]
    end
    P["🛡️ SLSA Build Level 2 Verified"]
    inputs --> P
    P --> P_T0["📋 tenet-1<br/>slsa.dev/verification_summary/v1"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `https://slsa.dev/verification_summary/v1`

**Evaluation:**
```cel
outputs.pass && outputs.levels.exists(k, v, (v == 'SLSA_BUILD_LEVEL_2' || v == 'SLSA_BUILD_LEVEL_3' || v == 'SLSA_BUILD_LEVEL_4') )
```

**Outputs:**
- `levels`: `has(predicates[0].data.verifiedLevels) ? predicates[0].data.verifiedLevels : [] `
- `pass`: `has(predicates[0].data.verificationResult) ? predicates[0].data.verificationR...`

**On pass:** VSA attesting a SLSA_BUILD_2+ compliance verification

**On fail:** SLSA Build L2+ not recored in verification summary

