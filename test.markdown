---
title: Curriculum Vitae
---

##Personal Information

###UID, Last Name, First Name, Middle Name, Contact Information

{{ me.last_name }}, {{ me.first_name }}  
{{ me.academic_address }}  
{{ me.academic_email }}  
{{ me.url }}  
UID: {{ me.uid }}  

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
