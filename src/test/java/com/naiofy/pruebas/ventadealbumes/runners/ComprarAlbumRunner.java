package com.naiofy.pruebas.ventadealbumes.runners;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features = "src/test/resources/feature/comprar_album.feature")

public class ComprarAlbumRunner {
}
