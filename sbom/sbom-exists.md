# SBOM Available

Checks that an attested SBOM describing the artifact is available, in either SPDX or CycloneDX format.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `sbom-exists` |
| **Assert mode** | OR |
| **Tenets** | 2 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://cyclonedx.org/bom"]
        A1["📄 https://spdx.dev/Document"]
        A2["📄 https://spdx.dev/Document/v3"]
    end
    P["🛡️ SBOM Available"]
    inputs --> P
    P --> P_M{"ANY tenet passing suffices"}
    P_M --> P_T0["📋 tenet-1<br/>spdx.dev/Document, spdx.dev/Document/v3"]
    P_M --> P_T1["📋 tenet-2<br/>cyclonedx.org/bom"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `https://spdx.dev/Document`
- `https://spdx.dev/Document/v3`

**Evaluation:**
```cel
size(predicates) > 0
```

**On pass:** Found attested SBOM (SPDX)

**On fail:** No SPDX SBOM found
**Guidance:** Generate an SPDX SBOM from your code

### Tenet: `tenet-2`

**Attestation types:**
- `https://cyclonedx.org/bom`

**Evaluation:**
```cel
size(predicates) > 0
```

**On pass:** Found attested SBOM (CycloneDX)

**On fail:** No CycloneDX SBOM found
**Guidance:** Generate a CycloneDX SBOM from your code

