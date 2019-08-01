# ComodoroPy - Chequea que tu servidor siga con vida...  

### Y que hace ?
 - Ejecutas `install.sh` que va a descargar algunas dependecias, y genera un `cron job` cada 5 minutos
 - Le especificas un servidor `HOST` y `PORT` en el archivo de `comodoro.py`
 - El cron ejecuta este script repetitivamente haciendo un `GET` al server que le especificaste
 - Espera un `json` con ciertas keys, que tenes que indicarle y estableces la logica que necesitas 
 	- Ej :
 	```
 	{  
 		"lastTimerTick": 21:48,  
 		"messagesRate" : 1500  
 	}
 	```  
 	Luego esperarias controlar : 
 		- `(now - lastTimerTick) < 5 minutos`
 		- `messagesRate > 500`
 - Si esta todo ok, deja registro en un log (muy basico) de lo satisfactorio
 - Si algo fallo, envia una notificacion a `Firebase` con un topic, asi puede sonar una notificacion en tu fono
 - Para evitar una sobrecuota espera que pasen n segundos de la ultima falla, pero sigue dejando constancion en el log


### Que necesita para correr ?
 - Python 2 / Pip
 - Crontab
 - Credenciales generadas de Firebase


### Algo a futuro
Este script es muy muy basico y hace que tengan que escribir codigo la idea seria que el set de condiciones a controlar sea en otro archivo que el script deba parsear y por supuesto generar mas canales de aviso como bots de `Slack` o `Telegram`

Hace un tiempo hice este script chico, pero bastante util para evitar dolores
de cabeza a la hora de que algo vaya mal.
