---
title: Publications, Creative Works and Funding during Past Five Years
sections:
  contact_info: { template: contact, filter: contact }
  articles_inpress: {
    template: annotated_articles,
    query: "research/publications/articles :inpress +year",
    decorator: decorate_article
  }
  articles_published: {
    template: annotated_articles,
    query: "research/publications/articles :published +year <5",
    decorator: decorate_article
  }  
  proceedings_inpress: {
    template: annotated_articles,
    query: "research/publications/proceedings :inpress +year",
    decorator: decorate_proceeding
  }
  proceedings_published: {
    template: annotated_articles,
    query: "research/publications/proceedings :published +year <5",
    decorator: decorate_proceeding
  }
  preprints: {
    template: annotated_articles,
    query: "research/publications/preprints :published +year <5",
    decorator: decorate_preprint
  }
  software: {
    template: software,
    query: "research/works/software :released +date <5"
  }
  websites: {
    template: software,
    query: "research/works/websites :released +date <5"
  }
  grants: {
    template: grants,
    query: "research/funding/grants :funded"
  }
  grants_submitted: {
    template: grants_submitted,
    query: "research/funding/grants :submitted"
  }
  articles_submitted: {
    template: unpublished_articles,
    query: "research/publications/articles :submitted",
    decorator: decorate_article
  }
  articles_inrevision: {
    template: unpublished_articles,
    query: "research/publications/articles :inrevision",
    decorator: decorate_article
  }
  articles_revised: {
    template: unpublished_articles,
    query: "research/publications/articles :revision_submitted",
    decorator: decorate_article
  }
  proceedings_submitted: {
    template: unpublished_articles,
    query: "research/publications/proceedings :submitted",
    decorator: decorate_proceeding
  }
  proceedings_inrevision: {
    template: unpublished_articles,
    query: "research/publications/proceedings :inrevision",
    decorator: decorate_proceeding
  }
  proceedings_revised: {
    template: unpublished_articles,
    query: "research/publications/proceedings :revision_submitted",
    decorator: decorate_proceeding
  }
pandoc:
  options: -s --number-sections -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}.}
    - \renewcommand{\thesubsection}{\arabic{subsection}.}
    - \renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}
---

{{ contact_info }}

##Articles in Refereed Journals

{{ articles_inpress }}
{{ articles_published }}

##Published Conference Proceedings

{{ proceedings_inpress }}
{{ proceedings_published }}

##Pre-print/Working Paper (Not Work in Progress)

{{ preprints }}

##Completed Creative Works

###Software and Applications

{{ software }}

###Websites

{{ websites }}

##Sponsored Research, Grants

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
