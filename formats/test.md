---
title: "Héctor Corrada Bravo (Biographical Sketch)"
sections:
  education: { template: degrees, filter: degrees}
  appts: { template: appointments, query: "personal/appointments/academic_appointments :current" }
  honors: { template: fellowships, query: research/funding/fellowships }
  grants: { template: compact_grants, query: "research/funding/grants :funded" }
  advisess: { template: advising, filter: advising_phds }
  inpress: { template: annotated_articles, filter: articles_inpress }
  papers: { template: annotated_articles, filter: articles_fiveyears }
  proceedings: { template: annotated_articles, filter: refereed_proceedings_fiveyears }
  presentations: { template: presentations, query: "research/presentations/conferences :refereed <5 +date"}
pandoc:
  options: -s -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
---
# Education and Appointments #

{{education}}{{ appts }}

# Honors #

{{ honors }}

# Extramural Funding #

{{ grants }}

# Teaching Experience ##

#. 2015-present Developed and taught undergraduate course CMSC320 : Introduction to Data Science
#. 2017-present Developed and taught graduate course CMSC828O: Mathematical and Computational Modeling of Networks across Biological Scales
#. 2011-2015 Developed and taught graduate course CMSC702: Computational Systems Biology and Functional Genomics
#. 2012 Taught graduate course CMSC726: Machine Learning
#. 2017-present Developed and taught Master's Certificate course CMSC643: Machine Learning and Data Mining

# Advising #

Major professor for graduate students:

{{ advisess }}

# Publications (last 5 years) #

## Peer-reviewed journal articles ##

{{ inpress }}{{ papers }}

## Abstracts and other professional papers presented ##

{{ proceedings }}{{ presentations }}
