---
title: "Héctor Corrada Bravo"
sections: 
  papers: { template: annotated_articles, filter: articles_fiveyears }
  inpress: { template: annotated_articles, filter: articles_inpress }
  proceedings: { template: annotated_articles, filter: refereed_proceedings_fiveyears }
pandoc:
  options: -s -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
---

# Publications (last 5 years) #

## Peer-reviewed journal articles ##

{{ inpress }}{{ papers }}

## Refereed Conference Proceedings ##

{{ proceedings }}
