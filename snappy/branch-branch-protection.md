# Branch Protection Enabled

Reads the attested branch protection rules of the repository and fails when force pushes are allowed on the default branch.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SNAPPY-BRANCH-PROTECTION` |
| **Assert mode** | AND |
| **Tenets** | 3 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml"]
        A1["📄 http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml"]
    end
    P["🛡️ Branch Protection Enabled"]
    inputs --> P
    P --> P_M{"ALL tenets must pass"}
    P_M --> P_T0["📋 tenet-1<br/>github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml, github.com/carabiner-dev/snappy/specs/branch-rules.yaml"]
    P_M --> P_T1["📋 01<br/>github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml, github.com/carabiner-dev/snappy/specs/branch-rules.yaml"]
    P_M --> P_T2["📋 02<br/>github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml, github.com/carabiner-dev/snappy/specs/branch-rules.yaml"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml`
- `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`

**Evaluation:**
```cel
size(predicates) > 0
```

**On pass:** Found attested branch protection metadata

### Tenet: `01`

**Attestation types:**
- `http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml`
- `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`

**Evaluation:**
```cel
has(predicates[0].data.values) ? predicates[0].data.values.exists(rule, rule.type == "non_fast_forward") : false
```

**On pass:** Force pushing is disabled on default branch

**On fail:** Force pushes can be sent to main branch
**Guidance:** Create a branch ruleset protecting your default branch and enable "Block force pushes"

### Tenet: `02`

**Attestation types:**
- `http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml`
- `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`

**Evaluation:**
```cel
has(predicates[0].data.values) ? predicates[0].data.values.exists(rule, rule.type == "deletion") : false
```

**On pass:** Branch deletion is disabled on default branch

**On fail:** Branch delete protection is not enabled
**Guidance:** Create a branch ruleset protecting your default branch and enable "Restrict deletions"

