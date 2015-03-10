---
title: Hector Corrada Bravo
sections:
  contact_info: { template: contact, filter: contact }
  umd_academic_appointments: { template: appointments, filter: "umd_appointments" }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  educational_background: { template: degrees, filter: degrees }
  selected_articles: { template: annotated_articles, filter:  selected_articles, args: "limit=15" }
  refereed_proceedings: { template: annotated_articles, filter:  refereed_proceedings }
  invited_talks: { template: presentations, query: "research/presentations/talks :invited +date" }
  refereed_presentations: { template: presentations, query: "research/presentations/conferences :refereed +date" }
  symposia: { template: presentations, query: "research/presentations/symposia +date" }
  software: { template: software, query: "research/works/software :released +date" }
  websites: { template: software, query: "research/works/websites :released +date" }
  fellowships: { template: fellowships, query: research/funding/fellowships }
  editorships: { template: editorships, query: "service/review/editor" }
  journal_reviews: { template: reviews, filter: journal_reviews }
  press_reviews: { template: reviews, filter: press_reviews }
  conference_reviews: { template: reviews, filter: conference_reviews }
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

{{ grants }}

## Fellowships, Gifts and Other Funded Research ##

### Fellowships ###

{{ fellowships }}

## Submissions and Works in Progress ##

### Current Grant Applications ###

{{ grants_submitted }}

### Manuscripts in Preparation ###

{{ articles_inprep }}

### Manuscripts under Review ###

{{ articles_submitted }}

{{ proceedings_submitted }}

{{ articles_inrevision }}

# Teaching, Mentoring and Advising #

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

## External Service and Consulting ##

### Community Engagements, Local, State, National, International ###

{{ community_service }}

\setcounter{subsubsection}{4}

### Consultancies ###

{{ consulting }}




