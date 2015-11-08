---
title: Curriculum Vitae Addendum
sections:
  notarization: { template: notarization, filter: dummy }
  candp_grants: { template: grants, query: "research/funding/grants :addendum" }
pandoc:
  options: -s --number-sections -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}.}
    - \renewcommand{\thesubsection}{\thesection\Alph{subsection}.}
    - \renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}
---

{{{ notarization }}}

\stepcounter{section}

# Research, Scholarly, Creative and Professional Activities #

\setcounter{subsection}{9}

## Sponsored Research ##

### Grants ###

{{ candp_grants }}
