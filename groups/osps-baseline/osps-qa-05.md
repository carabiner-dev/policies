# No Executables in the Codebase

The version control system MUST NOT contain generated executable artifacts.

Checked through the attested OpenSSF Scorecard results with the `scorecard/binary-artifacts` policy.

## Overview

| Property | Value |
|----------|-------|
| **Type** | PolicyGroup |
| **ID** | `OSPS-QA-05` |
| **Blocks** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    G["📂 OSPS-QA-05"]
    G --> G_B0["⚡ Block 1"]
    G_B0 --> G_B0_P0["🛡️ SCORECARD-BINARY-ARTIFACTS"]
```

## Block: `block-1` (assert: AND)

### Policy: `SCORECARD-BINARY-ARTIFACTS`

Checks for binary artifacts in the repository

#### Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SCORECARD-BINARY-ARTIFACTS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

#### Tenets

##### Tenet: `01-scorecard`

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


