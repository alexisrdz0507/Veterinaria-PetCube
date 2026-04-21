from django.core.management.base import BaseCommand
from django.conf import settings
import pyodbc
import os
from datetime import datetime, timedelta

class Command(BaseCommand):
    help = 'Realiza backup de la base de datos SQL Server'
    
    def handle(self, *args, **options):
        backup_dir = os.path.join(settings.BASE_DIR, 'backups')
        if not os.path.exists(backup_dir):
            os.makedirs(backup_dir)
            self.stdout.write(f'📁 Directorio creado: {backup_dir}')
        
        fecha = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_file = os.path.join(backup_dir, f'PetCube_Backup_{fecha}.bak')
        
        conn_str = (
            "DRIVER={ODBC Driver 17 for SQL Server};"
            "SERVER=LAPTOP-EL2DOH7K\\SQLEXPRESS;"
            "DATABASE=PetCube_Veterinaria;"
            "Trusted_Connection=yes;"
        )
        
        try:
            self.stdout.write('🔄 Iniciando backup de la base de datos...')
            
            # Conexión con autocommit=True para evitar transacciones
            conn = pyodbc.connect(conn_str, autocommit=True)
            cursor = conn.cursor()
            
            backup_sql = f"""
            BACKUP DATABASE [PetCube_Veterinaria] 
            TO DISK = N'{backup_file}'
            WITH NOFORMAT, NOINIT, NAME = N'PetCube_Backup_{fecha}', 
            SKIP, NOREWIND, NOUNLOAD, STATS = 10
            """
            
            cursor.execute(backup_sql)
            cursor.close()
            conn.close()
            
            self.stdout.write(self.style.SUCCESS(f'✅ Backup creado exitosamente: {backup_file}'))
            
            # Eliminar backups antiguos (más de 30 días)
            eliminados = 0
            for file in os.listdir(backup_dir):
                file_path = os.path.join(backup_dir, file)
                file_time = datetime.fromtimestamp(os.path.getctime(file_path))
                if file_time < (datetime.now() - timedelta(days=30)):
                    os.remove(file_path)
                    eliminados += 1
            
            if eliminados > 0:
                self.stdout.write(f'🗑️ {eliminados} backup(s) antiguo(s) eliminado(s)')
                    
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'❌ Error al crear backup: {str(e)}'))