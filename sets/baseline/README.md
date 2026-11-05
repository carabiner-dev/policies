# OSPS Baseline PolicySet

This directory contains an AMPEL PolicySet to verify a project's conformance to
the [Open Source Project Security Baseline](https://baseline.openssf.org/) from
OpenSSF.

This set is designed to showcase a large number of formats and technologies that
ampel can use to validate the OSPS Baseline requirements.

## Policy set

<!-- policyctl:index:sets:begin -->
| ID | Name | Version | Policies | Groups | Predicate types |
|----|------|---------|----------|--------|-----------------|
| [`OSPS`](osps-baseline.policy.md) | OpenSSF Security Baseline |  | 0 | 36 | `http://github.com/carabiner-dev/snappy/specs/branch-rules.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/github/branch-rules.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/github/org.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/github/repo.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/org.yaml`<br>`http://github.com/carabiner-dev/snappy/specs/repo.yaml`<br>`https://cyclonedx.org/bom`<br>`https://docs.oasis-open.org/openeox/core/v1.0`<br>`https://docs.oasis-open.org/openeox/eox-core/v1.0`<br>`https://github.com/ossf/security-insights-spec`<br>`https://github.com/slsa-framework/slsa-source-poc/source-provenance/v1-draft`<br>`https://in-toto.io/attestation/test-result/v0.1`<br>`https://openvex.dev/ns`<br>`https://openvex.dev/ns/v0.2.0`<br>`https://ossf.github.io/osv-schema/results`<br>`https://ossf.github.io/osv-schema/results@v1`<br>`https://ossf.github.io/osv-schema/results@v1.6.7`<br>`https://predicates.policylabs.dev/grype/v1`<br>`https://predicates.policylabs.dev/trivy/v1`<br>`https://scorecard.dev/result/v0.1`<br>`https://slsa.dev/provenance/v0.2`<br>`https://slsa.dev/provenance/v1`<br>`https://spdx.dev/Document` |
<!-- policyctl:index:sets:end -->

## Controls and Policy Choices

Some OSPS Baseline controls may be satisfied by more than one policy type or 
format, here are our mapping suggestions:

| Control | Policy Choices |
| --- | --- |
| OSPS-AC-01 | SNAPPY-MFA-ALL |
| OSPS-AC-02 | SNAPPY-ORG-EXISTS |
| OSPS-AC-03 | SNAPPY-BRANCH-PROTECTION |
| OSPS-AC-04 | SCORECARD-TOKEN-PERMISSIONS |
| OSPS-GV-01 | SI-ROLES |
| OSPS-GV-02 | SNAPPY-REPO-HAS-ISSUES |
| OSPS-GV-03 | SBOM-CONTRIBUTING-MD |
| OSPS-GV-04 | (not implemented / not implementable) |
| OSPS-LE-02 | SBOM-LICENSE-IS-OSS SI-LICENSE-IS-OSS |
| OSPS-LE-03 | SI-LICENSE-SET SBOM-HAS-LICENSE-FILE |
| OSPS-QA-01 | SNAPPY-REPO-PUBLIC-GIT |
| OSPS-QA-02 | SBOM-EXISTS |
| OSPS-QA-03 | SNAPPY-BRANCH-STATUS-CHECKS |
| OSPS-QA-04 | SI-HAS-SUBPROJECTS |
| OSPS-QA-05 | SCORECARD-BINARY-ARTIFACTS |
| OSPS-QA-06 | TEST-RESULTS-PASS |
| OSPS-QA-07 | SCORECARD-CODE-REVIEW |
| OSPS-SA-01 | (not implemented / not implementable) |
| OSPS-SA-02 | (not implemented / not implementable) |
| OSPS-SA-03 | SI-ASSESSMENTS |
| OSPS-BR-01 | SCORECARD-DANGEROURS-WF |
| OSPS-BR-02 | SBOM-HAS-VERSIONS |
| OSPS-BR-04 | SBOM-CHANGELOG  SI-CHANGELOG |
| OSPS-BR-05 | SBOM-LOCKFILE |
| OSPS-BR-06 | SLSA-HAS-ATTESTATION |
| OSPS-DO-01 | SI-HAS-DOCUMENTATION |
| OSPS-DO-02 | SI-VULN-REPORTING |
| OSPS-DO-03 | SI-SIGNATURE-VERIFY |
| OSPS-DO-04 | OPENEOX-EXISTS |
| OSPS-DO-05 | OPENEOX-EXISTS |
| OSPS-DO-06 | SI-DEPENDENCY-POLICY |
| OSPS-VM-01 | SBOM-SECURITY-MD |
| OSPS-VM-02 | SI-VULN-REP-CONTACT |
| OSPS-VM-04 | OPENVEX-VULNS-ARE-VEXED |
| OSPS-VM-05 | OPENVEX-NO-EXPLOITABLE-VULNS |
| OSPS-VM-06 | SCORECARD-SAST |
