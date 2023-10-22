from pydantic import BaseModel
from dataclasses import dataclass
from typing import Literal


@dataclass
class Profile(BaseModel):
    user_id: int
    user_name: str
    account_type: Literal["Admin", "Teacher", "Student"]


@dataclass
class Student(Profile):
    user_id: str
    user_name: str
    email: str
    dob: str
    standard: int
    section: str | int
    roll: int

