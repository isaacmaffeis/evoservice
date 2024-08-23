import sys
from pathlib import Path
import logging

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

def generate_script(root_path, script_path, extra_args):
    root_path = Path(root_path).resolve()
    script_path = Path(script_path)

    if script_path.exists():
        script_path.write_text('')


    # open script.sh in append mode
    with script_path.open('a') as script_file:

        script_file.write("#!/bin/bash\n\n")
        script_file.write('echo "# gen_evosuite.sh"\n')
        script_file.write('echo "## Generating test suite with EvoSuite"\n\n')
        logger.info(f"script head: '#!/bin/bash'")

        for folder in root_path.rglob('*'):
                if folder.is_dir():
                    folder_name = folder.name[0].lower() + folder.name[1:]
                    for file in folder.glob('*.java'):
                        file_name = file.stem  # file name without extension

                        if file_name != "Main":

                            logger.info(f"file name: {file_name}")

                            class_name = f"{folder_name}.{file_name}"
                            logger.info(f"class_name: {class_name}")

                            command = f"java -jar evosuite-1.0.6.jar -class org.evoservice.{class_name}"
                            logger.info(f"command without args: {command}")

                            if extra_args:
                                command += " " + " ".join(extra_args)

                            command += "\n"

                            script_file.write(f'echo "Running evosuite-1.0.6 on {class_name}..."\n')
                            script_file.write(command)
                            logger.info(f"script write: {command}")
        script_file.write('\necho "gen_evosuite.sh process completed."\n')



if __name__ == "__main__":
    #cp_path = "./target/classes"
    src_path = "./src/main/java"
    script_path = "./scripts/gen_evosuite.sh"

    extra_args = sys.argv[1:]

    generate_script(src_path, script_path, extra_args)
