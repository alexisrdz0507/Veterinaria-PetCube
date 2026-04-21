from django.core.management.base import BaseCommand
from django.db import models
from veterinaria.models import PerfilUsuario

class Command(BaseCommand):
    help = 'Limpia perfiles de usuario duplicados por id_cliente'

    def handle(self, *args, **options):
        # Encontrar id_cliente que aparecen más de una vez
        duplicados = PerfilUsuario.objects.values('id_cliente').annotate(
            count=models.Count('id_cliente')
        ).filter(count__gt=1, id_cliente__isnull=False)

        for dup in duplicados:
            id_cliente = dup['id_cliente']
            perfiles = PerfilUsuario.objects.filter(id_cliente=id_cliente).order_by('id')
            # Mantener el primero (id más bajo), eliminar los demás
            if perfiles.exists():
                primer_perfil = perfiles.first()
                perfiles.exclude(id=primer_perfil.id).delete()
                self.stdout.write(f"Eliminando perfiles duplicados para id_cliente {id_cliente}, manteniendo ID {primer_perfil.id}")

        self.stdout.write(self.style.SUCCESS('Limpieza de duplicados completada'))