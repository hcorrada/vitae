---
title: Curriculum Vitae
sections:
  notarization: { template: notarization, filter: dummy }
  contact_info: { template: contact_with_uid, filter: contact }
  umd_academic_appointments: { template: appointments, filter: "umd_appointments" }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, query: personal/appointments/other_employment }
  educational_background: { template: degrees, filter: degrees }
  articles_inpress: { template: annotated_articles, filter: articles_inpress }
  articles_published: { template: annotated_articles, filter: articles_published }
  refereed_proceedings: { template: annotated_articles, filter:  refereed_proceedings }
  invited_talks: { template: presentations, query: "research/presentations/talks :invited +date" }
  refereed_presentations: { template: presentations, query: "research/presentations/conferences :refereed +date" }
  nonrefereed_presentations: { template: presentations, query: "research/presentations/conferences :nonrefereed +date" }
  symposia: { template: presentations, query: "research/presentations/symposia +date" }
  workshops: { template: presentations, query: "research/presentations/symposia +date" }
  preprints: { template: annotated_articles, filter: preprints }
  software: { template: software, query: "research/works/software :released +date" }
  websites: { template: software, query: "research/works/websites :released +date" }
pandoc:
  options: -s --number-sections
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}}
    - \renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
---

{{{ notarization }}}

#Personal Information

##UID, Last Name, First Name, Middle Name, Contact Information

{{ contact_info }}

##Academic Appointments at UMD

{{ umd_academic_appointments }}

\stepcounter{subsection}

##Other Employment

{{ notumd_academic_appointments }}
{{ other_employment }}

##Educational Background

{{ educational_background }}

#Research, Scholarly and Creative Activites

\setcounter{subsection}{2}

##Articles in Refereed Journals

{{ articles_inpress }}

{{ articles_published }}

## Published Conference Proceedings ##
	
### Refereed Conference Proceedings ###

{{ refereed_proceedings }}

## Conferences, Workshops and Talks ##

\stepcounter{subsubsection}

### Invited Talks ###

{{ invited_talks }}

### Refereed Presentations ###

{{ refereed_presentations }}

\setcounter{subsubsection}{6}

### Non-Refereed Presentations ###

{{ nonrefereed_presentations }}

\setcounter{subsubsection}{10}

### Symposia ###

{{ symposia }}

### Workshops ###

{{ workshops }}

## Professional Publications ##

\stepcounter{subsubsection}

### Pre-print/Working Paper (Not Work in Progress) ###

{{ preprints }}

\stepcounter{subsection}

## Completed Creative Works ##

\stepcounter{subsubsection}

\setcounter{subsubsection}{7}

### Software and Applications ###

{{ software }}

### Websites ###

 {{ websites }}

\stepcounter{subsection}

## Sponsored Research ##

### Grants ###

Grants go here

### Contracts ###

Contracts go here

## Fellowships, Gifts and Other Funded Research ##

### Fellowships ###

Fellowshpis go here

## Submissions and Works in Progress ##

### Current Grant Applications ###

Current Grant Applications here

### Manuscripts in Preparation ###

Manuscripts in prep

### Manuscripts under Review ###

under review

### Working papers in Preparation ###

papers in preparation

### Designs in preparation ###

software in prep


