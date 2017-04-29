# git-conf-sync
Store and sync system configuration with git

# Curiass

Sistema de distribución de claves de usuario. 

# Primitivas:

1. Inicializar anillo (setup)

	a) Crear un repositorio git

2. Inicializar host (init)

	a) Crear configuración y script de control
	b) Crear claves del nodo
	c) Añadir nodo al anillo

3. Importar datos, del anillo al host (import)

	a) Establecer la configuración del área de intercambio en la configuración del host

4. Extraer datos, desde el host al anillo (export)

	a) Extraer cuentas de usuaro y almacenar en área de intercambio

5. Codificar datos (encode)

	a) Empaquetar
	b) Actualizar el anillo de claves local con las claves del repo
	c) Cifrar

6. Decodificar datos (decode)

	a) Descifrar vault
	b) Desempaquetar en área de intercambio

7. Sincronizar (checkout)

	a) Actualizar repositorio 

8. Difusión (commit)

	a) Copiar vault al repo
	b) Transmitir cambios al repositorio

9. Neutralizar host (delete)

	a) Eliminar del anillo la clave del host
	b) Transmitir cambios al repositorio
	c) Eliminar área de intercambio
	d) Eliminar copia local del repositorio

# Cómo funciona


# Instalación

1. Requsitos

Para que esto funcione, necesitas:

  * bash
  * git
  * gpg

2. Crea tu propio repositorio de claves, haciendo un fork del proyecto
https://github.com/lizard-era/git-conf-store, puede ser en github o en
cualquier otro servidor git. Puedes utilizar un repositorio público o
privado, el fichero que almacena las claves se cifra antes de subir.

3. Descarga el proyecto curiass, el lugar por defecto para el proyecto
es /opt/curiass.

  # cd /opt
  # git clone https://github.com/lizard-era/git-conf-sync.git curiass

3. Establece tus parámetros de configuración, edita el siguiente fichero:

  /opt/curiass/etc/git-conf-sync.cfg

E indica los siguientes datos

  * GCS_HOST_ID: Identificador del nodo del anillo o nombre del equipo
  * GCS_GIT_USER: Usuario de git para el repositorio del almacén de datos
  * GCS_GIT_PASS: Contraseña del usuario anterior

El fichero de configuración no se transmite al repositorio

4. Generar anillo

Ejecutar el proceso setup.sh para generar el anillo de claves

5. Configurar cron

(por hacer)

