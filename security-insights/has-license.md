# License Declared

Reads the project's attested [Security Insights](https://github.com/ossf/security-insights-spec) file. Fails when the repository's license is not set.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-LICENSE-SET` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/ossf/security-insights-spec"]
    end
    P["🛡️ License Declared"]
    inputs --> P
    P --> P_T0["📋 01-si<br/>github.com/ossf/security-insights-spec"]
```

## Tenets

### Tenet: `01-si`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
outputs.license != '' 
```

**Outputs:**
- `license`: `has(predicates[0].repository) ? (has(predicates[0].repository.license) ? (has...`

**On pass:** Found a license entry in the project's security insights file.

**On fail:** Could not detect a license entry in the security insights file.
**Guidance:** Add a license entry to your SI file under repository.release.license

