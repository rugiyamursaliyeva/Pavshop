from django.contrib import admin
from core.models import Contact, OurAddress, TeamMember, Subscribe, OurSponsors, CultureImage
# Register your models here.

admin.site.register(Contact)
admin.site.register(OurAddress)
admin.site.register(TeamMember)
admin.site.register(Subscribe)
admin.site.register(OurSponsors)
admin.site.register(CultureImage)