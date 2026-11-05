# Administrators Listed

Reads the project's attested [Security Insights](https://github.com/ossf/security-insights-spec) file. Fails when the project does not list its administrators.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-ROLES` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/ossf/security-insights-spec"]
    end
    P["🛡️ Administrators Listed"]
    inputs --> P
    P --> P_T0["📋 01-si<br/>github.com/ossf/security-insights-spec"]
```

## Tenets

### Tenet: `01-si`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
outputs.admins.found 
```

**Outputs:**
- `admins`: `has(predicates[0].data.project) ? (has(predicates[0].data.project.administrat...`

**On pass:** Administrators listed in Securty Insights

**On fail:** Security Insights has no project administrators
**Guidance:** List the project admins in your SI yaml under repository.administrators

