# Allowed Trivy Severities

Passes an attested [trivy](https://github.com/aquasecurity/trivy) vulnerability report only when every finding has a severity the verifier explicitly allowed. Each severity has its own boolean context value, all off by default, so the policy fails on any finding unless its severity was enabled.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `trivy-allow-severity` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Context Values

| Name | Type | Required | Default |
|------|------|----------|---------|
| `allowCritical` | bool | no | `false` |
| `allowHigh` | bool | no | `false` |
| `allowLow` | bool | no | `false` |
| `allowMedium` | bool | no | `false` |
| `allowUnknown` | bool | no | `false` |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://predicates.policylabs.dev/trivy/v1"]
        C0["⚙️ allowCritical: bool = false"]
        C1["⚙️ allowHigh: bool = false"]
        C2["⚙️ allowLow: bool = false"]
        C3["⚙️ allowMedium: bool = false"]
        C4["⚙️ allowUnknown: bool = false"]
    end
    P["🛡️ Allowed Trivy Severities"]
    inputs --> P
    P --> P_T0["📋 tenet-1<br/>predicates.policylabs.dev/trivy/v1"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `https://predicates.policylabs.dev/trivy/v1`

**Evaluation:**
```cel
outputs.disallowedCount == 0
```

**Outputs:**
- `disallowedCount`: `has(predicate.data.Results) ? size(predicate.data.Results.map(r, has(r.Vulner...`

**On pass:** All attested trivy vulnerabilities have an allowed severity

**On fail:** Attested trivy report has {{ .Outputs.disallowedCount }} vulnerabilities with a disallowed severity
**Guidance:** Remediate the vulnerabilities or enable their severity level via the allow* policy context values

