import os
import requests
from typing import Literal, List, Optional
from datetime import datetime, timedelta
import pytz

from blueprints.function_calling_blueprint import Pipeline as FunctionCallingBlueprint

def now():
    return datetime.now(pytz.timezone('Europe/Moscow'))

class Pipeline(FunctionCallingBlueprint):
    class Valves(FunctionCallingBlueprint.Valves):
        # Add your custom parameters here
        pass

    class Tools:
        def __init__(self, pipeline) -> None:
            self.pipeline = pipeline

        def get_current_time(
            self,
        ) -> str:
            """
            Get the current time.

            :return: The current time.
            """

            current_time = now().strftime("%H:%M:%S")
            return f"Current Time = {current_time}"

        def cost_of_remaining_stock(
            self,
            days: int,
        ) -> str:
            """
            Get the cost of the remaining stock on the specified date.

            :param days: The number of days of deviation from the current date. If it is now, then 0. If yesterday, then -1. If a week ago, then -7.
            :return: The value of the remaining stock on the specified date.
            """

            date = now()
            date = date + timedelta(days=days)
            res = requests.post('http://example-function-calling/indicators', json={ "name": "store", "date": date.strftime('%Y-%m-%dT%H:%M:%S.%f') })
            return f"The product in stock is estimated at ${res.text} at {date.strftime('%d %B %Y')}"

    def __init__(self):
        prompt="""Tools: {}

        If a function tool doesn't match the query, return an empty string. Else, pick a function tool, fill in the parameters from the function tool's schema, and return it in the format {{ "name": \"functionName\", "parameters": {{ "key": "value" }} }}. Only pick a function if the user asks. Only return the object. Do not return any other text. The answer should start with a curly brace. The answer should end with a curly brace.
        """

        super().__init__(prompt)
        # Optionally, you can set the id and name of the pipeline.
        # Best practice is to not specify the id so that it can be automatically inferred from the filename, so that users can install multiple versions of the same pipeline.
        # The identifier must be unique across all pipelines.
        # The identifier must be an alphanumeric string that can include underscores or hyphens. It cannot contain spaces, special characters, slashes, or backslashes.
        # self.id = "my_tools_pipeline"
        self.name = "My Tools Pipeline"
        self.valves = self.Valves(
            **{
                **self.valves.model_dump(),
                "pipelines": ["*"],  # Connect to all pipelines
            },
        )
        self.tools = self.Tools(self)
