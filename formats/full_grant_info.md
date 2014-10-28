---
title: Full Grant Report
sections:
  grants: { template: grants, query: "research/funding/grants :funded" }
  fellowships: { template: fellowships, query: research/funding/fellowships }
  grants_submitted: { template: grants, query: "research/funding/grants :submitted" }
  grants_declined: { template: grants, query: "research/funding/grants :declined" }
pandoc:
  options: -s --number-sections
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
---

Sponsored Research
------------------

## Grants ##

{{ grants }}

## Fellowships, Gifts and Other Funded Research ##

### Fellowships ###

{{ fellowships }}

# Current Grant Applications #

{{ grants_submitted }}

# Declined Grant Applications #

{{ grants_declined }}
