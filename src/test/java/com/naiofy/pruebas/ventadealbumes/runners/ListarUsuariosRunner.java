package com.naiofy.pruebas.ventadealbumes.runners;

import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(com.intuit.karate.junit4.Karate.class)
@CucumberOptions(features = "src/test/resources/feature/listar_usuarios.feature")

public class ListarUsuariosRunner {
}
