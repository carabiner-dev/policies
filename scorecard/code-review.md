# Code Review Required

Reads the project's attested [OpenSSF Scorecard](https://scorecard.dev) results. Fails when Scorecard reports that changes to the primary branch do not require a review from another party.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SCORECARD-CODE-REVIEW` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://scorecard.dev/result/v0.1"]
    end
    P["🛡️ Code Review Required"]
    inputs --> P
    P --> P_T0["📋 01-scorecard<br/>scorecard.dev/result/v0.1"]
```

## Tenets

### Tenet: `01-scorecard`

**Attestation types:**
- `https://scorecard.dev/result/v0.1`

**Evaluation:**
```cel
outputs.codereview.all(c, c.score == 10)
```

**Outputs:**
- `codereview`: `has(predicates[0].data.checks) ? predicates[0].data.checks.filter(c, c.name =...`

**On pass:** Scorecard reports code review is required for changes

**On fail:** Scorecard detected code review is not enabled in the repository
**Guidance:** Ensure your repo requires a review from another party for every pull request

