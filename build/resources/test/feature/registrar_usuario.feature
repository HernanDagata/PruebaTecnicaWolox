Feature: Prueba registro de usuario

  Como usurio regular de la aplicacion
  Quiero realizar el registro en la aplicacion
  Para poder autenticarme en la aplicacion

  Background: Precarga
    * def urlBase = 'https://nodejs-qa-training.herokuapp.com/'

  Scenario Outline: Registro de usuario exitoso
    * def jsonUsuario =
   """
   {
   "email": "<newUserMail>",
   "password": "<newUserPassword>",
   "firstName": "<newUserFirstName>",
   "lastName": "<newUserLastName>"
   }
   """
    Given url urlBase + 'users'
    And request jsonUsuario
    When method post
    Then status <statusCode>
    * print response
    And match response contains <resultadoEsperado>

    Examples:
      | newUserMail      | newUserPassword | newUserFirstName | newUserLastName | statusCode | resultadoEsperado     |
      | h13@wolox.com.ar | Hernan123       | Hernan           | Garcia          | 201        | {user_id: '#notnull'} |

  Scenario Outline: Registro de usuario escenarios alternos
    * def jsonUsuario =
   """
   {
   "email": "<newUserMail>",
   "password": "<newUserPassword>",
   "firstName": "<newUserFirstName>",
   "lastName": "<newUserLastName>"
   }
   """
    Given url urlBase + 'users'
    And request jsonUsuario
    When method post
    Then status <statusCode>
    * print response
    And match response.errors[0].message contains <resultadoEsperado>

    Examples:
      | newUserMail     | newUserPassword | newUserFirstName | newUserLastName | statusCode | resultadoEsperado                                      |
      | h6@wolox.com.co | Herna1**        | Hernan           | Garcia          | 422        | "The email must be @wolox.com.ar"                      |
      | h2@wolox.com.ar | Herna1**        | Hernan01         | Garcia          | 422        | "first_name"                                           |
      | h3@wolox.com.ar | Herna1**        | Hernan           | Garcia 98       | 422        | "last_name"                                            |
      | h1@wolox.com.ar | Herna1**        | Hernan           | Garcia 98       | 422        | "The resource you are trying to create already exists" |