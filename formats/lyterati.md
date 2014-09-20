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
pandoc:
  geometry: margin=1in
  fontsize: 10pt
---

{{{ notarization }}}

#Personal Information

##UID, Last Name, First Name, Middle Name, Contact Information

{{ contact_info }}

##Academic Appointments at UMD

{{ umd_academic_appointments }}

##Administrative Appointments at UMD

##Other Employment

{{ notumd_academic_appointments }}
{{ other_employment }}

##Educational Background

{{ educational_background }}

##Professional Certifications and Licenses

#Research, Scholarly and Creative Activites

##Books
##Chapters
##Articles in Refereed Journals

{{ articles_inpress }}

{{ articles_published }}

## Published Conference Proceedings ##

### Refereed Conference Proceedings ###

{{ refereed_proceedings }}

