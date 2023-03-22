
from django.contrib import admin
from django.db import router
from django.urls import path, include

from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls.i18n import i18n_patterns

from .router import router

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api1/', include('fact_app.urls')),

] 

urlpatterns += i18n_patterns(
    path('', include('fact_app.urls')),

)

if settings.DEBUG:

    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)