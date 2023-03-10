# Generated by Django 4.1.6 on 2023-03-04 20:52

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Administrateur',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=100)),
                ('prenom', models.CharField(max_length=100)),
                ('mdp', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=100)),
                ('prenom', models.CharField(max_length=100)),
                ('refgps', models.CharField(max_length=15)),
                ('telephone', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Commande',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nbre_cmd', models.IntegerField()),
                ('prix', models.IntegerField()),
                ('date_cmd', models.DateTimeField()),
                ('statut', models.CharField(choices=[('en attente', 'en attente'), ('annulée', 'annulée'), ('en cours', 'en cours'), ('livrée', 'livrée')], default='En attente', max_length=30)),
                ('Client', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.client')),
            ],
        ),
        migrations.CreateModel(
            name='Livreur',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False)),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('nom', models.CharField(max_length=100, unique=True)),
                ('password', models.CharField(max_length=255)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Produits',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('masse', models.IntegerField()),
                ('qte', models.IntegerField()),
                ('date_add', models.DateTimeField(auto_now_add=True)),
                ('price', models.DecimalField(decimal_places=2, max_digits=15)),
                ('image', models.ImageField(upload_to='product')),
                ('Commande', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.commande')),
            ],
        ),
        migrations.CreateModel(
            name='Livraison',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heure_livraison', models.DateTimeField()),
                ('lieu', models.CharField(max_length=125)),
                ('montant', models.IntegerField()),
                ('livreur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='LigneCommande',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantite', models.IntegerField()),
                ('prix', models.FloatField()),
                ('commande', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.commande')),
                ('produits', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.produits')),
            ],
        ),
        migrations.AddField(
            model_name='commande',
            name='Livraison',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.livraison'),
        ),
        migrations.CreateModel(
            name='Approvisionnement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('QteAppro', models.IntegerField()),
                ('Client', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='RestAPI.client')),
            ],
        ),
    ]
