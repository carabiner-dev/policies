# Policy: `SLSA-BUILDER-BASE`

Deprecated, use `slsa/slsa-builder-id.json` instead.

Checks that the builder recorded in the artifact's SLSA provenance matches the `builderId` context value, either exactly or as a prefix followed by `@`.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SLSA-BUILDER-BASE` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Context Values

| Name | Type | Required | Default |
|------|------|----------|---------|
| `builderId` | string | **yes** |  |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://slsa.dev/provenance/v1"]
        C0["⚙️ builderId: string (required)"]
    end
    P["🛡️ SLSA-BUILDER-BASE"]
    inputs --> P
    P --> P_T0["📋 tenet-1<br/>slsa.dev/provenance/v1"]
```

## Tenets

### Tenet: `tenet-1`

**Attestation types:**
- `https://slsa.dev/provenance/v1`

**Evaluation:**
```cel
outputs.builderId == context.builderId || outputs.builderId.startsWith(context.builderId + '@')
```

**Outputs:**
- `builderId`: `has(predicates[0].data.runDetails) ? (has(predicates[0].data.runDetails.build...`

**On pass:** Authorized builder ID detected

**On fail:** Builder identifier mismatch
**Guidance:** The attestation builder does not match the context defined builder (want {{ .Context.builderId }} got {{ .Outputs.builderId }})

