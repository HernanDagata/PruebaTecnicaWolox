package com.naiofy.pruebas.ventadealbumes.runners;

import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(com.intuit.karate.junit4.Karate.class)
@CucumberOptions(features = "src/test/resources/feature/comprar_album.feature")

public class ComprarAlbumRunner {
}
