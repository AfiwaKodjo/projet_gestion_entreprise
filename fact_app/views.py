from django.shortcuts import render
from django.views import View
from .models import * 
from django.contrib import messages
import datetime
import json
import jwt
from rest_framework.views import APIView
from django.shortcuts import render
from fact_app.models import Livreur
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.response import Response
from fact_app.serializers import LivreurSerializer
from django.contrib.auth.hashers import check_password
from .models import Livreur
from django.http import HttpResponse

import datetime

from django.template.loader import get_template

from django.db import transaction

from .utils import pagination, get_invoice

from .decorators import *

from django.utils.translation import gettext as _


# Create your views here.

"""class HomeView(LoginRequiredSuperuserMixim, View):
     
   
     
    

    templates_name = 'index.html'

    clients = Client.objects.select_related('client').all()

    context = {
        'clients': clients
    }

    def get(self, request, *args, **kwargs):

        items = pagination(request, self.clients)

        self.context['clients'] = items

        return render(request, self.templates_name, self.context)


    def post(self, request, *args, **kwargs):

        # modify an invoice

        if request.POST.get('id_modified'):

            paid = request.POST.get('modified')

            try: 

                obj = Client.objects.get(id=request.POST.get('id_modified'))

                if paid == 'True':

                    obj.paid = True

                else:

                    obj.paid = False 

                obj.save() 

                messages.success(request,  _("Change made successfully.")) 

            except Exception as e:   

                messages.error(request, f"Sorry, the following error has occured {e}.")      

        # deleting an invoice    

        if request.POST.get('id_supprimer'):

            try:

                obj = Invoice.objects.get(pk=request.POST.get('id_supprimer'))

                obj.delete()

                messages.success(request, _("The deletion was successful."))   

            except Exception as e:

                messages.error(request, f"Sorry, the following error has occured {e}.")      

        items = pagination(request, self.invoices)
        
        self.context['invoices'] = items

        return render(request, self.templates_name, self.context)    
"""

class AddCustomerView(LoginRequiredSuperuserMixim, View):
     """ add new customer """    
     template_name = 'add_customer.html'

     def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

     def post(self, request, *args, **kwargs):
        
        data = {
            'nom': request.POST.get('nom'),
            'prenom': request.POST.get('prenom'),
            'longitude': request.POST.get('longitude'),
            'latitude': request.POST.get('latitude'),
            'telephone': request.POST.get('telephone'),
            

        }

        try:
            created = Client.objects.create(**data)

            if created:

                messages.success(request, "Client enregistré avec succès.")

            else:

                messages.error(request, "Client non enregistré.")

        except Exception as e:    

            messages.error(request, f"Sorry our system is detecting the following issues {e}.")

        return render(request, self.template_name)   



class AddInvoiceView(LoginRequiredSuperuserMixim, View):
    """ add a new invoice view """

    template_name = 'add_invoice.html'

    clients = Client.objects.select_related('save_by').all()

    context = {
        'clients': clients
    }

    def get(self, request, *args, **kwargs):
        return  render(request, self.template_name, self.context)

    @transaction.atomic()
    def post(self, request, *args, **kwargs):
        
        items = []

        """try: 

            customer = request.POST.get('client')

            type = request.POST.get('invoice_type')

            articles = request.POST.getlist('article')

            qties = request.POST.getlist('qty')

            units = request.POST.getlist('unit')

            total_a = request.POST.getlist('total-a')

            total = request.POST.get('total')

            comment = request.POST.get('commment')

            invoice_object = {
                'customer_id': customer,
                'save_by': request.user,
                'total': total,
                'invoice_type': type,
                'comments': comment
            }

            invoice = Invoice.objects.create(**invoice_object)

            for index, article in enumerate(articles):

                data = Article(
                    invoice_id = invoice.id,
                    name = article,
                    quantity=qties[index],
                    unit_price = units[index],
                    total = total_a[index],
                )

                items.append(data)

            created = Article.objects.bulk_create(items)   

            if created:
                messages.success(request, "Données enregistrées avec succès.") 
            else:
                messages.error(request, "Désolé, veuillez réessayer les données envoyées sont corrompues.")    

        except Exception as e:
            messages.error(request, f"Désolé, l'erreur suivante s'est produite{e}.")   

        return  render(request, self.template_name, self.context)
"""

"""class InvoiceVisualizationView(LoginRequiredSuperuserMixim, View):
    
   # Cette vue permet de visualiser la facture 
    
   

    template_name = 'invoice.html'

    def get(self, request, *args, **kwargs):

        pk = kwargs.get('pk')

        context = get_invoice(pk)

        return render(request, self.template_name, context)


@superuser_required
def get_invoice_pdf(request, *args, **kwargs):
    

    pk = kwargs.get('pk')

    context = get_invoice(pk)

    context['date'] = datetime.datetime.today()

    # get html file
    template = get_template('invoice-pdf.html')

    # render html with context variables

    html = template.render(context)

    # options of pdf format 

    options = {
        'page-size': 'Letter',
        'encoding': 'UTF-8',
        "enable-local-file-access": ""
    }

    # generate pdf 

    pdf = pdfkit.from_string(html, False, options)

    response = HttpResponse(pdf, content_type='application/pdf')

    response['Content-Disposition'] = "attachement"

    return response
"""







class RegisterView(APIView):
    def post(self, request):
        serializer=LivreurSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
# Create your views here.

class LoginView(APIView):
    def post(self, request):
        nom=request.data['nom']
        password=request.data['password']
      
    
    
        livreur = Livreur.objects.filter(nom=nom).first()
        #livreur2 = Livreur.objects.filter(password=password).first()
    
        if livreur is None:
            raise AuthenticationFailed('Utilisateur n\'existe pas')
        
        if not livreur.check_password(password):
            raise AuthenticationFailed('Mot de passe incorrect')
            
        
        payload = {
            'id': livreur.id,
            'exp':datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat':datetime.datetime.utcnow()
        }
        
        token = jwt.encode(payload, 'secret', algorithm='HS256')
        
        response = Response()
            
        response.set_cookie(key='jwt', value=token,httponly=True)
        response.data = {
            'jwt':token
        }
        return response
    
class LivreurView(APIView):
    def get(self, request):
        token = request.COOKIES.get('jwt')
        
        if not token:
            raise AuthenticationFailed('Pas d\'authentification!')
        
        try:
            payload = jwt.decode(token, 'secret', algorithms=['HS256'])
            
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('Pas d\'authentification!')

        livreur = Livreur.objects.filter(id=payload['id']).first()
        serializer = LivreurSerializer(livreur)
        
        return Response(serializer.data)
        
        
        
class LogoutView(APIView):
    def post(self, request):
        response = Response()
        response.delete_cookie('jwt')     
        response.data = {
            'message':'succès'
        } 
        return response

"""from rest_framework.views import APIView
from .serializers import LivreurSerializer
from rest_framework.response import Response

from livreur.serializers import LivreurSerializer

# Create your views here.
class RegisterView(APIView):
    def post(self, request):
        serializer=LivreurSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
        """
