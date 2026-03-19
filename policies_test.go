// SPDX-FileCopyrightText: Copyright 2026 Carabiner Systems, Inc
// SPDX-License-Identifier: Apache-2.0

package policies_test

// This file invokes the test harness. This is experimental
import (
	"testing"

	"github.com/carabiner-dev/lexecutor"
)

func TestPolicies(t *testing.T) {
	lexecutor.RunAllTests(t, ".")
}
