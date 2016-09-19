---
title: Hector Corrada Bravo
sections:
  contact_info: { template: contact, filter: contact }
  umd_academic_appointments: { template: appointments, filter: "umd_appointments" }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, query: personal/appointments/other_employment }
  educational_background: { template: degrees, filter: degrees }
  selected_articles: { template: annotated_articles, filter: selected_articles }
  refereed_proceedings: { template: annotated_articles, filter:  refereed_proceedings }
  invited_talks: { template: presentations, query: "research/presentations/talks :invited +date" }
  refereed_presentations: { template: presentations, query: "research/presentations/conferences :refereed +date" }
  symposia: { template: presentations, query: "research/presentations/symposia +date" }
  software: { template: software, query: "research/works/software :released +date" }
  websites: { template: software, query: "research/works/websites :released +date" }
  grants: { template: grants, query: "research/funding/grants :funded" }
  fellowships: { template: fellowships, query: research/funding/fellowships }
  articles_submitted: { template: unpublished_articles, filter: articles_submitted }
  articles_inrevision: { template: unpublished_articles, filter: articles_inrevision }
  articles_revised: { template: unpublished_articles, filter: articles_revised }
  proceedings_submitted: { template: unpublished_articles, filter:  proceedings_submitted }
  proceedings_revised: { template: unpublished_articles, filter: proceedings_revised }
  courses_taught: { template: courses_taught, filter: courses_taught }
  courses_developed: { template: courses_developed, filter: courses_developed }
  advising_doctoral: { template: advising, filter: advising_doctoral }
  advising_undergrad: { template: advising, filter: advising_undergrad }
  teaching_workshops: { template: presentations, query: "teaching/workshops" }
  editorships: { template: editorships, query: "service/review/editor" }
  journal_reviews: { template: reviews, filter: journal_reviews }
  press_reviews: { template: reviews, filter: press_reviews }
  panel_reviews: { template: reviews, filter: panel_reviews }
  conference_reviews: { template: reviews, filter: conference_reviews }
  dept_service: { template: committees, query: "service/committees :department" }
  college_service: { template: committees, query: "service/committees :college" }
  community_service: { template: committees, query: "service/committees :community" }
  conference_service: { template: committees, query: "service/committees :conference" }
  consulting: { template: consulting, query: "service/consulting" }
pandoc:
  options: -s --number-sections
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}.}
    - \renewcommand{\thesubsection}{\thesection\Alph{subsection}.}
    - \renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}
---

#Personal Information

{{ contact_info }}

##Academic Appointments 

{{ umd_academic_appointments }}

##Other Employment

{{ notumd_academic_appointments }}
{{ other_employment }}

##Educational Background

{{ educational_background }}

#Research, Scholarly and Creative Activites

\footnotesize
_Annotation: corresponding authors\*, lead authors\textasciicircum, advisee\textsuperscript{\#}_
\normalsize

## Selected Articles in Refereed Journals

{{ selected_articles }}

## Published Conference Proceedings ##
	
### Refereed Conference Proceedings ###

{{ inpress_proceedings }}
{{ refereed_proceedings }}

## Conferences, Workshops and Talks ##

### Invited Talks ###

{{ invited_talks }}

### Presentations, Symposia and Workshops ###

{{ refereed_presentations }}
{{ nonrefereed_presentations }}
{{ symposia }}
{{ workshops }}

## Professional Publications ##

\stepcounter{subsubsection}

### Pre-print/Working Paper (Not Work in Progress) ###

{{ preprints }}
\stepcounter{subsection}

## Completed Creative Works ##

### Software and Applications ###

{{ software }}

### Websites ###

 {{ websites }}

\stepcounter{subsection}

## Sponsored Research ##

### Grants ###

{{ grants }}

## Fellowships, Gifts and Other Funded Research ##

### Fellowships ###

{{ fellowships }}

### Manuscripts under Review ###

{{ articles_revised }}
{{ articles_inrevision }}
{{ articles_submitted }}
{{ proceedings_inrevision }}
{{ proceedings_submitted }}

# Teaching, Mentoring and Advising #

## Courses Taught ##

{{ courses_taught }}

## Teaching Innovations ##

### Course or Curriculum Development ###

{{ courses_developed }}

## Advising ##

### Undergraduate ###

{{ advising_undergrad }}

### Master's ###

### Doctoral ###

{{ advising_doctoral }}

## Professional and Extension Education ##

### Workshops ###

{{ teaching_workshops }}

# Service and Outreach #

## Editorships, Editorial Boards, and Reviewing Activities ##

### Editorships ###

{{ editorships }}

### Reviewing Activities for Journals and Presses ###

{{ journal_reviews }}  
{{ press_reviews }}

### Reviewing Activities for Agencies and Foundations ###

{{ panel_reviews }}

### Reviewing Activities for Conferences ###

{{ conference_reviews }}

## Committees, Professional and Campus Service ##

### Campus Service - Department ###

{{ dept_service }}

### Campus Service - College ###

{{ college_service }}

## External Service and Consulting ##

### Community Engagements, Local, State, National, International ###

{{ community_service }}

### Consultancies ###

{{ consulting }}

