# Component Versions

Checks that every top-level component of the SBOM has a version. The SBOM is read through protobom, so SPDX and CycloneDX documents are handled alike.

Not to be confused with `PROTOBOM-SBOM-DOC-VERSION`, which checks the version of the SBOM document itself.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `PROTOBOM-SBOM-VERSIONS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://cyclonedx.org/bom"]
        A1["📄 https://spdx.dev/Document"]
        A2["📄 https://spdx.dev/Document/v3"]
    end
    P["🛡️ Component Versions"]
    inputs --> P
    P --> P_T0["📋 tenet-1"]
```

## Tenets

### Tenet: `tenet-1`

**Evaluation:**
```cel
outputs.versions.all(s, s != "")
```

**Outputs:**
- `versions`: `sboms[0].get_node_list().get_root_nodes().map(s, s.version)`

**On pass:** All top level components have versions

