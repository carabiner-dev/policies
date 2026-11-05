# groups/osps-baseline

## Policy groups

<!-- policyctl:index:groups:begin -->
| ID | Name | Version | Blocks | Policies | Predicate types |
|----|------|---------|--------|----------|-----------------|
| [`OSPS-AC-01`](osps-ac-01.md) | Use MFA for Sensitive Actions |  | 1 | 1 | `https://github.com/slsa-framework/slsa-source-poc/source-provenance/v1-draft` |
| [`OSPS-AC-02`](osps-ac-02.md) | Restrict Collaborator Permissions |  | 1 | 1 | `http://github.com/carabiner-dev/snappy/specs/github/org.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/org.yaml` |
| [`OSPS-AC-03`](osps-ac-03.md) | Protect the Primary Branch |  | 1 | 1 | `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml` |
| [`OSPS-AC-04`](osps-ac-04.md) | Least Privilege for CI/CD Pipelines |  | 1 | 1 | `https://scorecard.dev/result/v0.1` |
| [`OSPS-BR-01`](osps-br-01.md) | No Untrusted Input in Build Pipelines |  | 1 | 1 | `https://scorecard.dev/result/v0.1` |
| [`OSPS-BR-02`](osps-br-02.md) | Unique Version Identifiers |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-BR-04`](osps-br-04.md) | Change Log With Release |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-BR-05`](osps-br-05.md) | Standardized Dependency Tooling |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-BR-06`](osps-br-06.md) | Signed Releases |  | 1 | 1 | `https://slsa.dev/provenance/v0.2`<br>`https://slsa.dev/provenance/v1` |
| [`OSPS-DO-01`](osps-do-01.md) | User Guides Published |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-DO-02`](osps-do-02.md) | Defect Reporting Mechanism |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-DO-03`](osps-do-03.md) | Release Verification Instructions |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-DO-04`](osps-do-04.md) | Support Scope and Duration |  | 1 | 1 | `https://docs.oasis-open.org/openeox/core/v1.0`<br>`https://docs.oasis-open.org/openeox/eox-core/v1.0` |
| [`OSPS-DO-05`](osps-do-05.md) | Security Update Scope and Duration |  | 1 | 1 | `https://docs.oasis-open.org/openeox/core/v1.0`<br>`https://docs.oasis-open.org/openeox/eox-core/v1.0` |
| [`OSPS-DO-06`](osps-do-06.md) | Dependency Management Policy |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-GV-01`](osps-gv-01.md) | Roles and Responsibilities Published |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-GV-02`](osps-gv-02.md) | Public Discussion Mechanisms |  | 1 | 1 | `http://github.com/carabiner-dev/snappy/specs/github/repo.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/repo.yaml` |
| [`OSPS-GV-03`](osps-gv-03.md) | Contribution Guide Published |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-GV-04`](osps-gv-04.md) | Formal Review of Permission Grants |  | 1 | 1 | `https://slsa.dev/provenance/v0.2` |
| [`OSPS-LE-02`](osps-le-02.md) | Fully Open Source Licenses |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-LE-03`](osps-le-03.md) | License in a Well Known Location |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-QA-01`](osps-qa-01.md) | Source Code Publicly Readable |  | 1 | 1 | `http://github.com/carabiner-dev/snappy/specs/github/repo.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/repo.yaml` |
| [`OSPS-QA-02`](osps-qa-02.md) | Software Dependencies Published |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-QA-03`](osps-qa-03.md) | Status Checks Before Merging |  | 1 | 1 | `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml` |
| [`OSPS-QA-04`](osps-qa-04.md) | Security Requirements on All Codebases |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-QA-05`](osps-qa-05.md) | No Executables in the Codebase |  | 1 | 1 | `https://scorecard.dev/result/v0.1` |
| [`OSPS-QA-06`](osps-qa-06.md) | Automated Tests in CI/CD |  | 1 | 1 | `https://in-toto.io/attestation/test-result/v0.1` |
| [`OSPS-QA-07`](osps-qa-07.md) | Merge Approvals Required |  | 1 | 1 | `https://scorecard.dev/result/v0.1` |
| [`OSPS-SA-01`](osps-sa-01.md) | System Design Documentation |  | 1 | 1 | `https://slsa.dev/provenance/v0.2` |
| [`OSPS-SA-02`](osps-sa-02.md) | External Interface Descriptions |  | 1 | 1 | `https://slsa.dev/provenance/v0.2` |
| [`OSPS-SA-03`](osps-sa-03.md) | Security Assessment Maintained |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-VM-01`](osps-vm-01.md) | Coordinated Vulnerability Disclosure Policy |  | 1 | 1 | `https://cyclonedx.org/bom`<br>`https://spdx.dev/Document` |
| [`OSPS-VM-02`](osps-vm-02.md) | Vulnerability Reporting Contacts |  | 1 | 1 | `https://github.com/ossf/security-insights-spec` |
| [`OSPS-VM-04`](osps-vm-04.md) | Discovered Vulnerabilities Published |  | 3 | 3 | `https://openvex.dev/ns`<br>`https://openvex.dev/ns/v0.2.0`<br>`https://ossf.github.io/osv-schema/results@v1`<br>`https://ossf.github.io/osv-schema/results@v1.6.7`<br>`https://predicates.policylabs.dev/grype/v1`<br>`https://predicates.policylabs.dev/trivy/v1` |
| [`OSPS-VM-05`](osps-vm-05.md) | No Exploitable Vulnerabilities |  | 1 | 1 | `https://openvex.dev/ns/v0.2.0`<br>`https://ossf.github.io/osv-schema/results`<br>`https://ossf.github.io/osv-schema/results@v1`<br>`https://ossf.github.io/osv-schema/results@v1.6.7` |
| [`OSPS-VM-06`](osps-vm-06.md) | Application Security Testing Enforced |  | 1 | 1 | `https://scorecard.dev/result/v0.1` |
<!-- policyctl:index:groups:end -->
