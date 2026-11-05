# Least Privilege Tokens

Reads the project's attested [OpenSSF Scorecard](https://scorecard.dev) results. Fails when Scorecard detected workflows whose tokens hold more permissions than they need.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SCORECARD-TOKEN-PERMISSIONS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | OFF |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://scorecard.dev/result/v0.1"]
    end
    P["🛡️ Least Privilege Tokens"]
    inputs --> P
    P --> P_T0["📋 01-scorecard<br/>scorecard.dev/result/v0.1"]
```

## Tenets

### Tenet: `01-scorecard`

**Attestation types:**
- `https://scorecard.dev/result/v0.1`

**Evaluation:**
```cel
outputs.perms.all(c, c.score == 10)
```

**Outputs:**
- `perms`: `has(predicates[0].data.checks) ? predicates[0].data.checks.filter(c, c.name =...`

**On pass:** Scorecard reports workflows are configured with least privileges

**On fail:** Scorecard detected workflows with excessivce permissions
**Guidance:** Ensure workflows drop all privileges and only escalte when needed

