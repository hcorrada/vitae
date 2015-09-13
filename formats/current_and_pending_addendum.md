---
title: Current and Pending Support
sections:
  notarization: { template: notarization, filter: dummy }
  candp_grants: { template: candp_grants, filter: grant_addendum }
pandoc:
  options: -s --number-sections -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}.}
    - \renewcommand{\thesubsection}{\thesection\Aplh{subsection}.}
    - \renewcommand{\thesubsubsection}{\thesubsubsection\arabic{subsubsection}.}
---

{{{ notarization }}}

{{ candp_grants }}
