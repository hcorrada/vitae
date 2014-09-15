---
title: Curriculum Vitae
sections:
  contact_info: { template: contact_with_uid, filter: contact }
  umd_academic_appointments: { template: appointments, filter: umd_appointments }
  notumd_academic_appointments: { template: appointments, filter: notumd_appointments }
  other_employment: { template: appointments, filter: other_employment }
---

##Personal Information

###UID, Last Name, First Name, Middle Name, Contact Information

{{ contact_info }}

###Academic Appointments at UMD

{{ umd_academic_appointments }}

###Administrative Appointments at UMD

###Other Employment

{{ notumd_academic_appointments }}
{{ other_employment }}
