from django import views
from django.urls import include, path

from django_invoice import router

#from fact_app.viewset import LivreurView
from .views import LivreurView, LoginView, LogoutView, RegisterView,LivreurView

urlpatterns = [ 
    #path('', views.HomeView.as_view(), name='home'),
    #path('add-customer', views.AddCustomerView.as_view(), name='add-customer'),
    #path('add-invoice', views.AddInvoiceView.as_view(), name='add-invoice'),
    #path('view-invoice/<int:pk>', views.InvoiceVisualizationView.as_view(), name='view-invoice'),
    #path('invoice-pdf/<int:pk>', views.get_invoice_pdf, name="invoice-pdf"),
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('livreur', LivreurView.as_view()),
    path('logout', LogoutView.as_view()),


]