package org.evoservice.fileManager;

import java.io.FilenameFilter;
import java.util.ArrayList;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import org.mockito.stubbing.Answer;

import static org.mockito.Mockito.*;

public class FileManagerTest {

  private static final Logger logger = LogManager.getLogger(FileManagerTest.class);

  @Mock
  private File inputFolder;

  @Mock
  private File javaFile;

  @Before
  public void setUp() {
    // Inizializza i mock
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void testRetrieveInput() throws IOException {
    String inputDir = "input";
    String outputDir = "src/main/java";
    String fileName = "RegistroDiCassa.java";
    String packageName = "registroDiCassa";
    Path packagePath = mock(Path.class);
    Path targetPath = mock(Path.class);

    when(inputFolder.listFiles((FilenameFilter) any())).thenReturn(new File[]{javaFile});
    when(javaFile.getName()).thenReturn(fileName);

    // Mock dei metodi statici della classe Files
    MockedStatic<Files> mockedFiles = Mockito.mockStatic(Files.class);
    try {
      mockedFiles.when(() -> Files.createDirectories(any())).thenReturn(packagePath);

      mockedFiles.when(() -> Files.readAllLines(any())).thenReturn(new ArrayList<>(Arrays.asList("public class RegistroDiCassa {}")));

      mockedFiles.when(() -> Files.write(any(Path.class), anyList())).thenReturn(targetPath);
      mockedFiles.when(() -> Files.delete(any())).thenAnswer(invocation -> null);

      FileManager.retrieveInput(inputDir, outputDir);

      mockedFiles.verify(() -> Files.createDirectories(any()), times(1));
      mockedFiles.verify(() -> Files.readAllLines(any()), times(1));
      mockedFiles.verify(() -> Files.write(any(Path.class), anyList()), times(1));
      mockedFiles.verify(() -> Files.delete(any()), times(1));
    } finally {
      mockedFiles.close();
    }
  }
}
