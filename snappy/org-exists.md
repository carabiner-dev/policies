# Organization Data Available

Checks that attested data about the GitHub organization hosting the project is available.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SNAPPY-ORG-EXISTS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 http://github.com/carabiner-dev/snappy/specs/github/org.yaml"]
        A1["📄 http://github.com/carabiner-dev/snappy/specs/org.yaml"]
    end
    P["🛡️ Organization Data Available"]
    inputs --> P
    P --> P_T0["📋 01<br/>github.com/carabiner-dev/snappy/specs/github/org.yaml, github.com/carabiner-dev/snappy/specs/org.yaml"]
```

## Tenets

### Tenet: `01`

**Attestation types:**
- `http://github.com/carabiner-dev/snappy/specs/github/org.yaml`
- `http://github.com/carabiner-dev/snappy/specs/org.yaml`

**Evaluation:**
```cel
true
```

**On pass:** Attested GitHub organization data found

