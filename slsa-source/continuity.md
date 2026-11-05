# Continuity Enforced

Checks the repository's SLSA source provenance for the `CONTINUITY_ENFORCED` property, which records that branch protection has been continuously enforced.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SLSA-SRC-CONTINUITY` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/slsa-framework/slsa-source-poc/source-provenance/v1-draft"]
        A1["📄 https://github.com/slsa-framework/source-tool/source-provenance/v1"]
    end
    P["🛡️ Continuity Enforced"]
    inputs --> P
    P --> P_T0["📋 01<br/>github.com/slsa-framework/source-tool/source-provenance/v1, github.com/slsa-framework/slsa-source-poc/source-provenance/v1-draft"]
```

## Tenets

### Tenet: `01`

**Attestation types:**
- `https://github.com/slsa-framework/source-tool/source-provenance/v1`
- `https://github.com/slsa-framework/slsa-source-poc/source-provenance/v1-draft`

**Evaluation:**
```cel
outputs.controls.one(c, c == 'CONTINUITY_ENFORCED')
```

**Outputs:**
- `controls`: `predicates[0].data.controls.map(c, c.name)`

**On pass:** Repository has continous enforcement of branch protection

