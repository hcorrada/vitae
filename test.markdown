---
title: Curriculum Vitae
---

##Personal Information

###UID, Last Name, First Name, Middle Name, Contact Information

{{ contact_info }}

###Academic Appointments at UMD
{% for appt in me.academic_appointments %}{% if appt.institution == "University of Maryland" %}
-  {{ appt.title }}, {{ appt.unit }}
   {{ appt.institution }}, {{ appt.location }}
   {{ appt.dates }}
{% endif %}{% endfor %}

###Administrative Appointments at UMD

###Other Employment
{% for appt in me.academic_appointments %}{% if appt.institution != "University of Maryland" %}
-  {{ appt.title }}, {{ appt.unit }}
   {{ appt.institution }}, {{ appt.location }}
   {{ appt.dates }}
{% endif %}{% endfor %}
