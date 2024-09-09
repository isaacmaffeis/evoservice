import os
import shutil
import logging

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


def clean(to_delete,to_keep):

    for directory in to_delete:

        logger.info(f"Cleaning the director: {directory}")

        for item in os.listdir(directory):
          item_path = os.path.join(directory, item)

          if item in to_keep:
            logger.info(f"Keeping the file: {item}")
            continue

          if os.path.isdir(item_path):
            # delete the directory
            shutil.rmtree(item_path)
          else:
            # delete the file
            os.remove(item_path)

          logger.info(f"Deleting the file: {item}")


if __name__ == "__main__":

    # File path to delete
    input = './input/'
    target_dir = './target/'
    main_dir = './src/main/java/org/evoservice/'
    test_dir = './src/test/java/'
    evosuite_tests_dir = './evosuite-tests/'
    evosuite_report_dir = './evosuite-report/'

    # File to keep
    main_file = 'Main.java'
    gitignore_file = '.gitignore'

    # Sets
    to_delete = {input,
                 target_dir,
                 main_dir,
                 test_dir,
                 evosuite_tests_dir,
                 evosuite_report_dir}

    to_keep = {main_file,
               gitignore_file}

    clean(to_delete,to_keep)
