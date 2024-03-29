---
title: "Héctor Corrada Bravo"
sections:
  contact_info: { template: contact, filter: contact }
  umd_academic_appointments: { template: appointments, filter: "umd_appointments" }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, query: personal/appointments/other_employment }
  educational_background: { template: degrees, filter: degrees }
  selected_articles: { template: annotated_articles, filter: selected_articles }
  articles_fiveyears: { template: annotated_articles, filter: articles_published }
  articles_published: { template: annotated_articles, filter: articles_published }
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

# Education and Appointments

{{ educational_background }}
{{ umd_academic_appointments }}

# Honors

{{ fellowships }}

# Extramural Funding

{{ grants }}

# Teaching Experiences 

{{ courses_taught }}

# Advising

Major professor for graduate students

{{ advising_doctoral }}

# Publications (last five years)

## Peer-reviwed journal articles

{{ articles_published }}

## Abstracts and other professional papers presented

{{ refereed_proceedings }}
{{ refereed_presentations }}

