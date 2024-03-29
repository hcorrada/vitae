---
title: "Curriculum Vitae, Héctor Corrada Bravo"
sections:
  notarization: { template: notarization, filter: dummy }
  contact_info: { template: contact, filter: contact }
  umd_academic_appointments: { template: appointments, filter: umd_appointments }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, query: personal/appointments/other_employment }
  educational_background: { template: degrees, filter: degrees }
  articles_inpress: { template: annotated_articles, filter: articles_inpress }
  articles_published: { template: annotated_articles, filter: articles_published }
  inpress_proceedings: { template: annotated_articles, filter:  inpress_proceedings }
  refereed_proceedings: { template: annotated_articles, filter:  refereed_proceedings }
  invited_talks: { template: presentations, query: "research/presentations/talks :invited +date" }
  refereed_presentations: { template: presentations, query: "research/presentations/conferences :refereed +date" }
  nonrefereed_presentations: { template: presentations, query: "research/presentations/conferences :nonrefereed +date" }
  symposia: { template: presentations, query: "research/presentations/symposia +date" }
  workshops: { template: presentations, query: "research/presentations/symposia +date" }
  preprints: { template: annotated_articles, filter: preprints }
  software: { template: software, query: "research/works/software :released +date" }
  websites: { template: software, query: "research/works/websites :released +date" }
  grants: { template: grants, query: "research/funding/grants :funded" }
  grants_completed: { template: grants, query: "research/funding/grants :completed" }
  fellowships: { template: fellowships, query: research/funding/fellowships }
  grants_submitted: { template: grants_submitted, query: "research/funding/grants :submitted" }
  articles_inprep: { template: unpublished_articles, filter: articles_inprep }
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
  media_recognition: { template: media_recognition, query: "awards/media" }
pandoc:
  options: -s --number-sections -V graphics
  geometry: margin=.75in
  fontsize: 10pt
  fontfamily: utopia
  header-includes:
    - \renewcommand{\thesection}{\Roman{section}.}
    - \renewcommand{\thesubsection}{\thesection\Alph{subsection}.}
    - \renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhf{}
    - \fancyhead[LO,RE]{Héctor Corrada Bravo, CV}
    - \fancyhead[LE,RO]{\today}
    - \fancyfoot[LE,RO]{\thepage}
---

#Personal Information

##Contact Information

{{ contact_info }}

##Academic Appointments at University of Maryland

{{ umd_academic_appointments }}

\stepcounter{subsection}

##Other Employment

{{ notumd_academic_appointments }}
{{ other_employment }}

##Educational Background

{{ educational_background }}

#Research, Scholarly, Creative and Professional Activites

\footnotesize
_Annotation: corresponding authors\*, lead authors\textasciicircum, advisee\textsuperscript{\#}_
\normalsize

\setcounter{subsection}{2}

##Articles in Refereed Journals

{{ articles_inpress }}
{{ articles_published }}

## Published Conference Proceedings ##

### Refereed Conference Proceedings ###

{{ inpress_proceedings }}
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

{{ grants }}
{{ grants_completed }}

## Fellowships, Gifts and Other Funded Research ##

### Fellowships ###

{{ fellowships }}

## Submissions and Works in Progress ##

### Manuscripts under Review ###

{{ articles_revised }}
{{ articles_inrevision }}
{{ articles_submitted }}
{{ proceedings_revised }}
{{ proceedings_inrevision }}
{{ proceedings_submitted }}

# Teaching, Advising and Mentoring #

## Courses Taught ##

{{ courses_taught }}

## Teaching Innovations ##

\setcounter{subsubsection}{4}

### Course or Curriculum Development ###

{{ courses_developed }}

## Advising ##

### Undergraduate ###

{{ advising_undergrad }}

### Master's ###

### Doctoral ###

{{ advising_doctoral }}

\setcounter{subsection}{5}

## Professional and Extension Education ##

\setcounter{subsubsection}{2}

### Workshops ###

{{ teaching_workshops }}

# Service and Outreach #

## Editorships, Editorial Boards, and Reviewing Activities ##

### Editorships ###

{{ editorships }}

\stepcounter{subsubsection}

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

\setcounter{subsubsection}{6}

### Leadership Roles in Meetings and Conferences

{{ conference_service }}

## External Service and Consulting ##

### Community Engagements, Local, State, National, International ###

{{ community_service }}

\setcounter{subsubsection}{4}

### Consultancies ###

{{ consulting }}

# Awards, Honors and Recognition #

\setcounter{subsection}{3}

## Recognition in Media ##

{{ media_recognition }}
