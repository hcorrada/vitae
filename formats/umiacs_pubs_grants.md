---
title: Recent publications and research funding
sections:
  notarization: { template: notarization, filter: dummy }
  articles_inpress: { template: annotated_articles, filter: articles_inpress }
  articles_published: { template: annotated_articles, filter: articles_published }
  inpress_proceedings: { template: annotated_articles, filter: inpress_proceedings }
  refereed_proceedings: { template: annotated_articles, filter: refereed_proceedings }
  preprints: { template: annotated_articles, filter: preprints }
  software: { template: software, query: "research/works/software :released +date <5" }
  websites: { template: software, query: "research/works/software :released +date <5" }
  grants: { template: grants, query: "research/funding/grants :funded" }
  grants_submitted: { template: grants_submitted, query: "research/funded/grants :submitted" }
  articles_submitted: { template: unpublished_articles, filter: articles_submitted }
  articles_inrevision: { template: unpublished_articles, filter: articles_inrevision }
  articles_revised: { template: unpublished_articles, filter: articles_revised }
  proceedings_submitted: { template: unpublished_articles, filter: proceedings_submitted }
  proceedings_inrevision: { template: unpublished_articles, filter: proceedings_inrevision }
  proceedings_revised: { template: unpublished_articles, filter: proceedings_revised }
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

#Selected Research, Scholarly, Creative and Professional Activities during Past Five Years

##Articles in Refereed Journals

{{ articles_inpress }}
{{ articles_published }}

##Published Conference Proceedings

###Refereed Conference Proceedings

{{ inpress_proceedings }}
{{ refereed_proceedings }}

##Completed Creative Works

###Software and Applications

{{ software }}

###Websites

{{ websites }}

##Sponsored Research

###Grants

{{ grants }}

##Submissions and Works in Progress

###Current Grant Applications

{{ grants_submitted }}

###Manuscripts under Review

{{ articles_revised }}
{{ articles_inrevision }}
{{ articles_submitted }}
{{ proceedings_revised }}
{{ proceedings_inrevision }}
{{ proceedings_submitted }}
