package org.evoservice;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.evoservice.fileManager.FileManager;

public class Main {

  private static final Logger logger = LogManager.getLogger(Main.class);

  public static void main(String[] args) {

    logger.info("==================================================");
    logger.info("Welcome to EvoService!");
    logger.info("Junit test suite generator using Evosuite");
    logger.info("Place a .java file in the input folder to begin...");
    logger.info("==================================================");

    String inputDir = "input";
    String outputDir = "src/main/java/org/evoservice";
    // move the input.java in the inputDir to the outputDir inside the project
    FileManager.retrieveInput(inputDir,outputDir);

  }
}