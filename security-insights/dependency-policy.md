# Dependency Policy Linked

Reads the project's attested [Security Insights](https://github.com/ossf/security-insights-spec) file. Fails when it does not link to the project's dependency management policy.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-DEPENDENCY-POLICY` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://github.com/ossf/security-insights-spec"]
    end
    P["🛡️ Dependency Policy Linked"]
    inputs --> P
    P --> P_T0["📋 01-si<br/>github.com/ossf/security-insights-spec"]
```

## Tenets

### Tenet: `01-si`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
outputs.deppolicy != '' 
```

**Outputs:**
- `deppolicy`: `has(predicates[0].data.repository) ? (has(predicates[0].data.repository.docum...`

**On pass:** Found a link to the projects dependency policy in SECURITY_INSIGHTS.yml

**On fail:** Could not detect a dependency policy in the Security Insights file.
**Guidance:** Add a changelog entry to your SI file under repository.documentation.dependency-management-policy.

