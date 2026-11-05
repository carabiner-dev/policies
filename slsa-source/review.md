# Code Review Required

Checks the repository's SLSA source provenance for the property recording that changes require code review.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SLSA-SRC-REVIEW` |
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
    P["🛡️ Code Review Required"]
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
outputs.controls.one(c, c == 'REVIEW_ENFORCED')
```

**Outputs:**
- `controls`: `predicates[0].data.controls.map(c, c.name)`

**On pass:** Repository enforces code review

