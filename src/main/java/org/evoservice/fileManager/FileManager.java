package org.evoservice.fileManager;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class FileManager {

  private static final Logger logger = LogManager.getLogger(FileManager.class);

  /**
   * Retrieve the input file from the input directory and move it to the output directory
   * inside the project.
   *
   * @param inputDir the input directory where the .java input file is placed
   * @param outputDir the destination path of the ava file
   */
  public static void retrieveInput(String inputDir, String outputDir){
    File inputFolder = new File(inputDir);
    File[] files = inputFolder.listFiles((dir, name) -> name.endsWith(".java"));

    if (files == null || files.length == 0) {
      logger.error("No file .java found in ./input");
      logger.error("Retrieve input operation failed.");
      return;
    }

    File javaFile = files[0];
    String fileName = javaFile.getName();
    logger.info("Java File found: " + fileName);

    String packageName = fileName.substring(0, fileName.lastIndexOf('.'));
    packageName = packageName.substring(0, 1).toLowerCase() + packageName.substring(1);
    String packageDeclaration = "package org.evoservice." + packageName + ";";
    logger.info("Package name: " + packageName);

    Path packagePath = Paths.get(outputDir, packageName.replace('.', '/'));
    logger.info("Moving: " + fileName + " to: " + packagePath + "...");

    try {
      Files.createDirectories(packagePath);
      logger.info("Created the package: " + packagePath);

      List<String> fileContent = Files.readAllLines(javaFile.toPath());
      fileContent.add(0,packageDeclaration);
      logger.info("Adding package declaration to java file: " + packageDeclaration);

      Path targetPath = packagePath.resolve(fileName);
      Files.write(targetPath, fileContent);
      Files.delete(javaFile.toPath());

      //Files.copy(javaFile.toPath(), targetPath, StandardCopyOption.REPLACE_EXISTING);
      //Files.move(javaFile.toPath(), targetPath, StandardCopyOption.REPLACE_EXISTING);
      logger.info("File moved successfully in : " + targetPath.toString());
    } catch (IOException e) {
      logger.error("An error occurred while moving the file to: " + packagePath);
      //e.printStackTrace();
      logger.error("Retrieve input operation failed.");
    }
  }

}
