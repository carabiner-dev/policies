# Documentation Linked

Reads the project's attested [Security Insights](https://github.com/ossf/security-insights-spec) file. Fails when the detailed guide field is not set.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-HAS-DOCUMENTATION` |
| **Assert mode** | AND |
| **Tenets** | 2 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/ossf/security-insights-spec"]
    end
    P["🛡️ Documentation Linked"]
    inputs --> P
    P --> P_M{"ALL tenets must pass"}
    P_M --> P_T0["📋 tenet-1<br/>github.com/ossf/security-insights-spec"]
    P_M --> P_T1["📋 tenet-2<br/>github.com/ossf/security-insights-spec"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
size(predicates) > 0
```

**On pass:** Security Insights attestation found

**On fail:** No Security Insights attestation found
**Guidance:** Capture your security insights flile in an attestations at build point

### Tenet: `tenet-2`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
outputs["docs"] != ""
```

**Outputs:**
- `docs`: `"documentation" in predicates[0].data.project ? ("detailed-guide" in predicat...`

**On pass:** Documentation link found in SECURITY_INSIGHTS.yaml

**On fail:** No documentation link found in SI
**Guidance:** Add a security insights file to your repository and define a documentation link

