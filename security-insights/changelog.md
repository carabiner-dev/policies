# Changelog Linked

Reads the project's attested [Security Insights](https://github.com/ossf/security-insights-spec) file. Fails when the release changelog field is not set.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-CHANGELOG` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/ossf/security-insights-spec"]
    end
    P["🛡️ Changelog Linked"]
    inputs --> P
    P --> P_T0["📋 01-si<br/>github.com/ossf/security-insights-spec"]
```

## Tenets

### Tenet: `01-si`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
outputs.changelog != '' 
```

**Outputs:**
- `changelog`: `has(predicates[0].data.repository) ? (has(predicates[0].data.repository.relea...`

**On pass:** Found a changelog entry in the project's security insights file.

**On fail:** Could not detect a changelog file in the security insights file.
**Guidance:** Add a changelog entry to your SI file under repository.release.changelog

