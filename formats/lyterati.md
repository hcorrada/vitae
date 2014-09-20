---
title: Curriculum Vitae
sections:
  notarization: { template: notarization, filter: dummy }
  contact_info: { template: contact_with_uid, filter: contact }
  umd_academic_appointments: { template: appointments, filter: umd_appointments }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, filter: other_employment }
  educational_background: { template: degrees, filter: degrees }
  articles_inpress: { template: annotated_articles, filter: articles_inpress }
  articles_published: { template: annotated_articles, filter: articles_published }
  refereed_proceedings: { template: annotated_articles, filter:  refereed_proceedings }
  invited_talks: { template: conference, filter: invited_talks }
  refereed_presentations: { template: conference, filter: refereed_presentations }
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



