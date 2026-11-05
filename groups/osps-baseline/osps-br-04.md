# Change Log With Release

All releases MUST provide a descriptive log of functional and security modifications.

Checked through the release SBOM with the `sbom/sbom-contains-changelog` policy, which looks for a changelog among the project's files.

## Overview

| Property | Value |
|----------|-------|
| **Type** | PolicyGroup |
| **ID** | `OSPS-BR-04` |
| **Blocks** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    G["📂 OSPS-BR-04"]
    G --> G_B0["⚡ Block 1"]
    G_B0 --> G_B0_P0["🛡️ sbom-contains-changelog"]
```

## Block: `block-1` (assert: AND)

### Policy: `sbom-contains-changelog`

Checks an SBOM to locate a Changelog in the file lists

#### Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `sbom-contains-changelog` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

#### Tenets

##### Tenet: `01-sbom`

**Attestation types:**
- `https://spdx.dev/Document`
- `https://cyclonedx.org/bom`

**Evaluation:**
```cel
size(outputs["files"]) > 0
```

**Outputs:**
- `files`: `sboms[0].get_node_list().get_nodes().filter(n, (n.name == 'CHANGELOG' || n.na...`

**On pass:** Found a changelog in the project's SBOM.

**On fail:** Could not detect a changelog file in the SBOM.
**Guidance:** Add a file named CHANGELOG to your project's codebase registering major changes.


