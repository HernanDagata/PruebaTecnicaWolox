Feature: Prueba autenticacion de usuario

  Como usurio regular de la aplicacion
  Quiero realizar la autenticacion
  Para poder acceder a las transacciones de la aplicacion

  Background: Precarga
    * def urlBase = 'https://nodejs-qa-training.herokuapp.com/'

  Scenario Outline: Autenticacion exitosa con usuario <tipousuario>
    * json jsonLogin = {"email": <newUserMail>, "password": <newUserPassword>}
    Given url urlBase + 'users/sessions'
    And request jsonLogin
    When method post
    Then status 200
    * print response
    And match response.token_expires_at contains <resultadoEsperado>
    * def idToken = response.token_expires_at
    * print idToken

    Examples:
      | tipousuario   | newUserMail        | newUserPassword    | resultadoEsperado |
      | Regular       | h@wolox.com.ar     | Hernan123          | '#notnull'        |
      | Administrador | admin@wolox.com.ar | candidatoWolox2020 | '#notnull'        |
