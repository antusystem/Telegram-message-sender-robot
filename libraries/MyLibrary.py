from robot.api import logger
import requests


class MyLibrary:
    """Give this library a proper name and document it."""

    def example_python_keyword(self):
        logger.info("This is Python!")

    def post_with_secrets(self, url, json=None):
        print("Qlq")
        try:
            if json is None:
                response = requests.post(url=url)
            else:
                response = requests.post(url=url, json=json)
            return response
        except Exception as err:
            print("suppressed")
