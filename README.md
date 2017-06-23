# manageCollaborators
Sistema para la gestion de colaboradores 

## Requisitos:
| Grails Version: 3.2.7   
| Groovy Version: 2.4.7   
| JVM Version: 1.8.0_121   
| Gradle 3.1   

## Proceso para iniciar APP  

Se accede desde la consola a la ruta:   
─manageCollaborators   
    └───manageCollaboratorWeb   

Ingrsa el comando:   
```groovy
  grails   
```   

Ahora ingresa la siguiente linea de codigo:   
```groovy
  grails> rA -port=1234   
```  

Aparece la ruta del servidor, solo acceder desde el navegador   
```groovy
grails> rA
| Running application...
Grails application running at http://localhost:8080 in environment: development
```  

## Conexion con base de datos   
Modificar el archivo __application.groovy__   
```sql
  username = "user"
  password = "password"
  url = "jdbc:mysql://localhost/database"
```    
