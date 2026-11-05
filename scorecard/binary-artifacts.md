# No Binary Artifacts

Reads the project's attested [OpenSSF Scorecard](https://scorecard.dev) results. Fails when Scorecard detected executables checked into the repository.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SCORECARD-BINARY-ARTIFACTS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://scorecard.dev/result/v0.1"]
    end
    P["🛡️ No Binary Artifacts"]
    inputs --> P
    P --> P_T0["📋 01-scorecard<br/>scorecard.dev/result/v0.1"]
```

## Tenets

### Tenet: `01-scorecard`

**Attestation types:**
- `https://scorecard.dev/result/v0.1`

**Evaluation:**
```cel
outputs.bin_artifacts_checks.all(c, c.score == 10)
```

**Outputs:**
- `bin_artifacts_checks`: `has(predicates[0].data.checks) ? predicates[0].data.checks.filter(c, c.name =...`

**On pass:** Scorecard did not detect any binaries in the repo

**On fail:** Scorecard detected binaries in the repository
**Guidance:** Check your codebase and remove any checked-in executables

