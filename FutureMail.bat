@echo off
color fa
title FutureMail
:pre
 cls
 echo 1. Iniciar Sesion
 echo 2. Registrarse
 set /p select=:
 if %select%==1 goto log else goto pre
 if %select%==2 goto login else goto pre
pause
:log
 cls
 set /p mail=Correo electronico:
 set /p pass=Contrasena:
 if exist intern\users\banneds\%mail% goto banned
pause
:Setup
 cls
 goto prepre_com_pass
pause
:prepre_com_pass
 cls
 if exist intern\users\%mail%\verified.cdat goto pre_com_pass
pause
:Setup
 cls
 echo Cuenta no verificada
 timeout /t 5
 goto pre
pause
:banned
 cls
 echo Has sido baneado por [PG] Systems
 echo Razon:
 type intern\users\banneds\%mail%\reason.cdat
 set /p =
 goto banned
pause
:pre_com_pass
 cls
 if exist intern\users\%mail% goto com_pass
pause
:Setup
 cls
 goto notlog
pause
:com_pass
 cls
 if exist intern\users\%mail%\pass\%pass%.cdat goto menu
pause
:notlog
 cls
 echo Correo electronico o contrasena incorrectos
 timeout /t 5
 goto log
pause
:Setup
 cls
 goto notlog
pause
:login
 cls
 echo Vamos a crear una cuenta
 set /p name=Escribe tu nombre:
 set /p apellido1=Tu primer apellido:
 set /p apellido2=Tu segundo apellido:
 set /p apodo=Escribe un apodo:
 set /p mail=Correo electronico:
 set /p pass=Contrasena:
 cls
 mkdir intern\users\%mail%
 mkdir intern\users\%mail%\pass
 mkdir intern\users\%mail%\messages
 mkdir intern\users\%mail%\pre-messages
 mkdir intern\users\%mail%\messages\mensajes-enviados
 mkdir intern\users\%mail%\data
 echo Nombre: %name%> intern\users\%mail%\data.cdat
 echo Apellidos: %apellido1% %apellido2%>> intern\users\%mail%\data.cdat
 echo Apodo: %apodo%>> intern\users\%mail%\data.cdat
 echo Correo electronico FutureMail: %mail%>> intern\users\%mail%\data.cdat
 echo Contrasena: %pass%>> intern\users\%mail%\data.cdat
 echo %name%> intern\users\%mail%\data\nombre.cdat
 echo %apellido1%> intern\users\%mail%\data\apellido1.cdat
 echo %apellido2%> intern\users\%mail%\data\apellido2.cdat
 echo %apodo%> intern\users\%mail%\data\apodo.cdat
 echo %mail%> intern\users\%mail%\data\correo.cdat
 echo %pass%> intern\users\%mail%\data\contrasena.cdat
 echo %pass%> intern\users\%mail%\pass\%pass%.cdat
 ipconfig >> intern\users\%mail%\data\ip.cdat
 echo %TIME% %DATE%>> intern\users\%mail%\data.cdat
 set /a compin=(%RANDOM%)
 echo Codigo de comfirmacion %compin%> intern\users\%mail%\data\compin-%compin%.cdat
 cls
 echo Se ha enviado un correo de comfirmacion a %mail%
 timeout /t 5
 echo De: [PG] Systems> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Para: Ti>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Asunto: Nuevo usuario de FutureMail>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Comprueba que los datos sean correctos:>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Nombre: %name%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Apellidos: %apellido1% %apellido2%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Apodo: %apodo%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Correo electronico FutureMail: %mail%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Contrasena: %pass%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Su codigo para comfirmar en la aplicacion que todo esta correcto y ha leido este correo: %compin%>> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo. >> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo. >> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo. >> intern\users\%mail%\messages\Nuevo-usuario.cdat
 echo Correo enviado con los servicios de FutureMail por [PG] Systems>> intern\users\%mail%\messages\Nuevo-usuario.cdat
pause
:compin
 cls
 start intern\users\%mail%\messages\Nuevo-usuario.cdat
 set /p compin2=Codigo de comfirmacion:
 if exist intern\users\%mail%\data\compin-%compin2%.cdat goto premenu
pause
:Setup
 cls
 echo Codigo de comfirmacion incorrecto
 timeout /t 5
 goto compin
pause
:premenu
 cls
 echo Cuenta verificada> intern\users\%mail%\verified.cdat
 start Presentacion.bat
 goto menu
pause
:menu
 cls
 echo Bienvenido 
 type intern\users\%mail%\data\nombre.cdat
 echo.
 echo 1. Enviar correo
 echo 2. Crear borrador
 echo 3. Grupos
 echo 4. Reportar usuario
 set /p selmenu=:
 if %selmenu%==1 goto send else goto menu
 if %selmenu%==2 goto createb else goto menu
 if %selmenu%==3 goto groups else goto menu
 if %selmenu%==4 goto reportes else goto menu
pause
:send
 cls
 set /p dest=Destinatario:
 set /p asun=Asunto:
 set /p text=Texto:
 cls
 echo De: %name% %apellido1%(%mail%)> intern\users\%dest%\messages\%asun%.cdat
 echo Para: Ti>> intern\users\%dest%\messages\%asun%.cdat
 echo Asunto: %asun%>> intern\users\%dest%\messages\%asun%.cdat
 echo Texto: %text%>> intern\users\%dest%\messages\%asun%.cdat
 echo. >> intern\users\%dest%\messages\%asun%.cdat
 echo Correo enviado con los servicios de FutureMail por [PG] Systems>> intern\users\%dest%\messages\%asun%.cdat
 echo De: %name% %apellido1%(%mail%)> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo Para: Ti>> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo Asunto: %asun%>> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo Texto: %text%>> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo. >> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo. >> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo. >> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 echo Correo enviado con los servicios de FutureMail por [PG] Systems>> intern\users\%mail%\mensajes-enviados\%asun%.cdat
 cls
 echo Mensaje enviado correctamente!
 timeout /t 5
 goto menu
pause
:createb
 cls
 echo Funcion de craecion de borradores en desarollo
 timeout /t 5
 goto menu
pause
:groups
 cls
 echo 1. Abrir grupo
 echo 2. Administar un grupo
 echo 3. Crear grupo
 echo 4. Unirte a un grupo
 set /p selgroups=:
 if %selgroups%==1 goto opengroup else goto groups
 if %selgroups%==2 goto admingroup else goto groups
 if %selgroups%==3 goto creategroup else goto groups
 if %selgroups%==4 goto unirme else goto groups
pause
:opengroup
 cls
 set /p group=Nombre del grupo:
 if exist intern\groups\%group%\baneos\%mail%.cdat goto notgroup
pause
:Setup
 if exist intern\groups\%group%\users\%mail%.cdat goto continue2
pause
:Setup
 cls
 goto notgroup2
pause
:continue2
 start intern\groups\%group%\read.bat
 goto escribir
pause
:escribir
 set /p mes=Escribe un mensaje al grupo:
 echo %mail% - %mes%    (%TIME%  %DATE%)> intern\groups\%group%\mes.cdat
 goto escribir
pause
:admingroup
 cls
 set /p group=Nombre del grupo:
 if exist intern\groups\%group%\admins\%mail% goto admingroupyes
pause
:Setup
 cls
 echo No eres administrador de este grupo
 timeout /t 5
 goto menu
pause
:admingroupyes
 start intern\groups\%group%
 goto menu
pause
:creategroup
 cls
 set /p group=Nombre que ponerle al grupo:
 mkdir intern\groups\%group%
 mkdir intern\groups\%group%\admins
 mkdir intern\groups\%group%\roles
 mkdir intern\groups\%group%\tareas
 mkdir intern\groups\%group%\solicitudes
 mkdir intern\groups\%group%\solicitudes\codigos
 mkdir intern\groups\%group%\baneos
 mkdir intern\groups\%group%\users
 echo Nombre del grupo: %group%> intern\groups\%group%\data.cdat
 echo Dueno: %mail%>> intern\groups\%group%\data.cdat
 type intern\users\%mail%\data\nombre.cdat>> intern\groups\%group%\data.cdat
 type intern\users\%mail%\data\apellido1.cdat>> intern\groups\%group%\data.cdat
 type intern\users\%mail%\data\apellido2.cdat>> intern\groups\%group%\data.cdat
 echo Admin nº1: %mail%>> intern\groups\%group%\admins\%mail%.cdat
 echo > intern\groups\%group%\mes.cdat
 echo @echo off> intern\groups\%group%\read.bat
 echo color fa>> intern\groups\%group%\read.bat
 echo title %group% - FutureMail>> intern\groups\%group%\read.bat
 echo :menu>> intern\groups\%group%\read.bat
 echo type intern\groups\%group%\mes.cdat>> intern\groups\%group%\read.bat
 echo timeout /t 1>> intern\groups\%group%\read.bat
 echo goto menu>> intern\groups\%group%\read.bat
 echo pause>> intern\groups\%group%\read.bat
 echo Admins sirve para poner a los agentes del grupo como Owners o Staffs.> intern\groups\%group%\admins\info.txt
 echo Roles sirve para crear roles con permisos y rangos como Administrador, etc...> intern\groups\%group%\roles\info.txt
 echo Tareas sirve para asignar, ver o eliminar tareas a los agentes.> intern\groups\%group%\tareas\info.txt
 echo En esta carpeta saldran las solicitudes de union al grupo las cuales seran aceptadas o rechazadas solo por owners o staffs. Saldra un codigo de verificacion, que el solicitante tendra que escribir dictado por unos owners o staffs.> intern\groups\%group%\solicitudes\info.txt
 echo En esta carpeta se guardaran los usuarios baneados que no podran volver a solicitar ni interactuar con los miembros de %group%> intern\groups\%group%\baneos\info.txt
 start intern\groups\%group%
 goto menu
pause
:unirme
 cls
 set /p group=Nombre del grupo al que unirse:
 if exist intern\groups\%group%\baneos\%mail%.cdat goto notgroup
pause
:Setup
 cls
 echo Nombre: > intern\groups\%group%\solicitudes\%mail%.cdat
 type intern\users\%mail%\data\nombre.cdat>> intern\groups\%group%\solicitudes\%mail%.cdat
 echo Apellidos: >> intern\groups\%group%\solicitudes\%mail%.cdat
 type intern\users\%mail%\data\apellido1.cdat>> intern\groups\%group%\solicitudes\%mail%.cdat
 type intern\users\%mail%\data\apellido2.cdat>> intern\groups\%group%\solicitudes\%mail%.cdat
 echo Apodo: >> intern\groups\%group%\solicitudes\%mail%.cdat
 type intern\users\%mail%\data\apodo.cdat>> intern\groups\%group%\solicitudes\%mail%.cdat
 echo Correo: >> intern\groups\%group%\solicitudes\%mail%.cdat
 type intern\users\%mail%\data\correo.cdat>> intern\groups\%group%\solicitudes\%mail%.cdat
 cls
 set /p textcurriculum=Explica porque quieres entrar al grupo:
 cls
 echo Curriculum:>> intern\groups\%group%\solicitudes\%mail%.cdat
 echo %textcurriculum%>> intern\groups\%group%\solicitudes\%mail%.cdat
 set /a compingroup=(%RANDOM%)
 echo Codigo de comfirmacion para unirse el usuario: %compingroup%>> intern\groups\%group%\solicitudes\%mail%.cdat
 echo >> intern\groups\%group%\solicitudes\codigos\%mail%-%compingroup%.cdat
 goto compingroup2
pause
:compingroup2
 cls
 set /p compingroup3=Codigo proporcionado por owner o staff:
 if exist intern\groups\%group%\solicitudes\codigos\%mail%-%compingroup%.cdat goto groupenter
pause
:Setup
 cls
 echo Codigo proporcionado por owner o staff incorrecto
 timeout /t 5
 goto compingroup2
pause
:groupenter
 cls
 echo Nombre: > intern\groups\%group%\users\%mail%.cdat
 type intern\users\%mail%\data\nombre.cdat>> intern\groups\%group%\users\%mail%.cdat
 echo Apellidos: >> intern\groups\%group%\users\%mail%.cdat
 type intern\users\%mail%\data\apellido1.cdat>> intern\groups\%group%\users\%mail%.cdat
 type intern\users\%mail%\data\apellido2.cdat>> intern\groups\%group%\users\%mail%.cdat
 echo Apodo: >> intern\groups\%group%\users\%mail%.cdat
 type intern\users\%mail%\data\apodo.cdat>> intern\groups\%group%\users\%mail%.cdat
 echo Correo: >> intern\groups\%group%\users\%mail%.cdat
 type intern\users\%mail%\data\correo.cdat>> intern\groups\%group%\users\%mail%.cdat
 goto menu
pause
:notgroup
 cls
 echo Has sido baneado de este grupo y no puedes acceder
 timeout /t 5
 goto menu
pause
:notgroup2
 cls
 echo No eres miembro de este grupo
 timeout /t 5
 goto menu
pause
:searchusers
 cls
 echo Proximamente
 timeout /t 5
 goto menu
pause
:reportes
 cls
 set /p correoreporte=Correo FutureMail del usuario a reportar:
 set /p razonreporte=Razon del reporte:
 set /a numerodereporte=(%RANDOM%)
 echo Nº de reporte: %numerodereporte%> intern\reportes\%numerodereporte%.cdat
 echo Correo del que reporta: %mail%>> intern\reportes\%numerodereporte%.cdat
 echo Correo del reportado: %correoreporte%>> intern\reportes\%numerodereporte%.cdat
 echo Razon del reporte: %razonreporte%>> intern\reportes\%numerodereporte%.cdat
 cls
 echo Reporte enviado! Gracias por ayudarnos a hacer seguro FutureMail.
 timeout /t 5
 goto menu
pause