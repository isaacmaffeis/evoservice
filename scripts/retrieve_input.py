import logging
from pathlib import Path

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


def retrieve_input(input_dir, output_dir):
    input_directory = Path(input_dir)
    files = [file for file in input_directory.glob("*.java")]

    if not files:
        logger.error("No .java file found in ./input")
        logger.error("Retrieve input operation failed.")
        return

    java_file = files[0]
    file_name = java_file.name
    logger.info(f"Java File found: {file_name}")

    package_name = file_name.rsplit('.', 1)[0]
    package_name = package_name[0].lower() + package_name[1:]
    package_declaration = f"package org.evoservice.{package_name};"
    logger.info(f"Package name: {package_name}")

    package_path = Path(output_dir) / package_name.replace('.', '/')
    logger.info(f"Moving: {file_name} to: {package_path}...")

    try:
        package_path.mkdir(parents=True, exist_ok=True)
        logger.info(f"Created the package: {package_path}")

        with java_file.open('r') as file:
            file_content = file.readlines()

        file_content.insert(0, package_declaration + '\n')
        logger.info(
          f"Adding package declaration to java file: {package_declaration}")

        target_path = package_path / file_name
        with target_path.open('w') as file:
            file.writelines(file_content)

        #java_file.unlink()
        #logger.info(f"File moved successfully in: {target_path}")
        logger.info(f"File copied successfully in: {target_path}")

    except OSError as e:
        logger.error(f"An error occurred while moving the file to: {package_path}")
        logger.error("Retrieve input operation failed.")


if __name__ == "__main__":

    input_folder = f"./input"
    output_folder = f"./src/main/java/org/evoservice"

    retrieve_input(input_folder, output_folder)
