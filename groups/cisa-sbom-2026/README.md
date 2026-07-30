# CISA 2026 SBOM Minimum Elements

This policy group checks an SBOM's conformance to the data field elements of
the [2026 Minimum Elements for a Software Bill of Materials (SBOM)](https://www.cisa.gov/sites/default/files/2026-07/2026_cisa_sbom_minimum_elements_508c.pdf),
published on July 29, 2026 by CISA and partner agencies. The document updates
and replaces the 2021 NTIA SBOM Minimum Elements (see
[`sets/ntia-minimum-elements`](../../sets/ntia-minimum-elements) for the 2021
policies).

The group defines one block per minimum element so that each element can be
verified by one or more alternative policies. All blocks must pass for the
SBOM to conform. Policies read the SBOM data through the protobom API, so both
SPDX and CycloneDX documents are supported.

Every block references its policy remotely from the standalone files under
[`protobom/`](../../protobom), pinned at commit
[`3c00b05`](https://github.com/carabiner-dev/policies/commit/3c00b05a78e32dd79385dcbfbdfa91b405e386c4).

## Element coverage

| CISA element | Block | Policy | Notes |
| --- | --- | --- | --- |
| SBOM Author | `sbom-author` | `PROTOBOM-AUTHOR` | |
| SBOM Author Signature | `sbom-author-signature` | `PROTOBOM-SBOM-SIGNED` | Advisory (`enforce: OFF`): checks the signature of the attestation wrapping the SBOM |
| SBOM Data Format Name | `sbom-data-format-name` | `PROTOBOM-SBOM-FORMAT-NAME` | |
| SBOM Data Format Version | `sbom-data-format-version` | `PROTOBOM-SBOM-FORMAT-VERSION` | |
| SBOM Generation Context | `sbom-generation-context` | `PROTOBOM-SBOM-GENERATION-CONTEXT` | SPDX 2.x cannot express lifecycle phases and is exempt |
| SBOM Timestamp | `sbom-timestamp` | `PROTOBOM-TIMESTAMP` | |
| SBOM Tool Name | `sbom-tool-name` | `PROTOBOM-SBOM-TOOL-NAME` | |
| SBOM Tool Version | `sbom-tool-version` | `PROTOBOM-SBOM-TOOL-VERSION` | Accepts versions embedded in SPDX tool creator strings |
| SBOM Version | `sbom-version` | `PROTOBOM-SBOM-DOC-VERSION` | Accepts document versions or unique identifiers (serial numbers, namespaces) |
| Component Producer | `component-producer` | `PROTOBOM-SBOM-PRODUCERS` | Checks originators, falling back to suppliers |
| Component Dependency Relationship | `component-dependency-relationship` | `PROTOBOM-RELATONSHIPS` | Advisory: the referenced policy ships with `enforce: OFF` |
| Component Hash Value | `component-hash-value` | `PROTOBOM-SBOM-HASHES` | |
| Component Hash Algorithm | `component-hash-algorithm` | `PROTOBOM-SBOM-HASH-ALGORITHMS` | |
| Component Identifiers | `component-identifiers` | `PROTOBOM-IDENTIFIERS` | |
| Component License | `component-license` | `PROTOBOM-SBOM-LICENSES` | Explicit unknown markers (NOASSERTION) satisfy the element |
| Component Name | `component-name` | `PROTOBOM-NAME` | |
| Component Version | `component-version` | `PROTOBOM-SBOM-VERSIONS` | |

The component data checks verify the top level (root) components of the SBOM,
following the convention of the existing protobom policies.

The Practices and Processes elements of the document (Accommodation of
Updates, Coverage, Distribution and Delivery, Explicitly Identifying Unknown
Information, Frequency, Machine-Processable Data) describe organizational
behavior and are not verifiable against a single SBOM document, so they are
not part of this group. The machine-verifiable core of Machine-Processable
Data is covered by the data format blocks.
