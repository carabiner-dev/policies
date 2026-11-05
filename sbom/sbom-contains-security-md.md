# Security Policy in SBOM

Looks through the files listed in the project's SBOM for a `SECURITY.md` file and fails when none is found.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `sbom-contains-security-md` |
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
    P["🛡️ Security Policy in SBOM"]
    inputs --> P
    P --> P_T0["📋 01-sbom<br/>spdx.dev/Document, spdx.dev/Document/v3, cyclonedx.org/bom"]
```

## Tenets

### Tenet: `01-sbom`

**Attestation types:**
- `https://spdx.dev/Document`
- `https://spdx.dev/Document/v3`
- `https://cyclonedx.org/bom`

**Evaluation:**
```cel
size(outputs["files"]) > 0
```

**Outputs:**
- `files`: `sboms[0].get_node_list().get_nodes().filter(n, (n.name == 'SECURITY.md' ))`

**On pass:** Found a SECURITY.md file in the project's SBOM.

**On fail:** Could not detect a SECURITY.md file in the SBOM.
**Guidance:** Add a file named SECURITY.md to your project's vulnerability disclosure policy

