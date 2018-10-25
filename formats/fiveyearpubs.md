---
title: "Publications during past five years"
sections: 
  contact_info: { template: contact, filter: contact }
  papers: { template: annotated_articles, filter: articles_fiveyears }
  inpress: { template: annotated_articles, filter: articles_inpress }
  proceedings: { template: annotated_articles, filter: refereed_proceedings_fiveyears }
  preprints: { template: annotated_articles, filter: preprints_fiveyears }
pandoc:
  options: -s -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
---

{{ contact_info }}

# Publications (last 5 years) #

## Peer-reviewed journal articles ##

{{ inpress }}{{ papers }}

## Refereed Conference Proceedings ##

{{ proceedings }}

## Preprints ##

{{ preprints }}
