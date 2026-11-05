# Security Assessment Maintained

The project MUST assess the security posture of all software assets in the project.

Checked through the project's Security Insights data with the `security-insights/assessments` policy.

## Overview

| Property | Value |
|----------|-------|
| **Type** | PolicyGroup |
| **ID** | `OSPS-SA-03` |
| **Blocks** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    G["📂 OSPS-SA-03"]
    G --> G_B0["⚡ Block 1"]
    G_B0 --> G_B0_P0["🛡️ SI-ASSESSMENTS"]
```

## Block: `block-1` (assert: AND)

### Policy: `SI-ASSESSMENTS`

Checks for assessments URL set in security insights

#### Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `SI-ASSESSMENTS` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

#### Tenets

##### Tenet: `01-si`

**Attestation types:**
- `https://github.com/ossf/security-insights-spec`

**Evaluation:**
```cel
size(outputs.assessments) > 0
```

**Outputs:**
- `assessments`: `has(predicates[0].data.repository) && has(predicates[0].data.repository.secur...`

**On pass:** Found at least one security assessment listed in security insights.

**On fail:** No assessments found in security insights
**Guidance:** Perform a security assessment on your project and record it in SECURITY_INSIGHTS.yml


