---
title: Current and Pending Support
sections:
  current_grants: {
    template: candp_grants,
    query: "research/funding/grants :funded",
    decorator: decorate_grant
  }
  pending_grants: {
    template: candp_grants,
    query: "research/funding/grants :submitted",
    decorator: decorate_grant
  }
pandoc:
  options: -s --number-sections
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
---

Investigator: Héctor Corrada Bravo

{{ current_grants}}
{{ pending_grants }}
