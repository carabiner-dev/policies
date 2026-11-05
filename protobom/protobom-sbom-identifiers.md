# Component Identifiers

Checks that every top-level component of the SBOM carries at least one software identifier, such as a package URL or a CPE. The SBOM is read through protobom, so SPDX and CycloneDX documents are handled alike.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `PROTOBOM-IDENTIFIERS` |
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
    P["🛡️ Component Identifiers"]
    inputs --> P
    P --> P_T0["📋 tenet-1"]
```

## Tenets

### Tenet: `tenet-1`

**Evaluation:**
```cel
outputs.identifiers.all(s, size(s) > 0)
```

**Outputs:**
- `identifiers`: `sboms[0].get_node_list().get_root_nodes().map(n, n.identifiers)`

**On pass:** Top level components have software identifiers

