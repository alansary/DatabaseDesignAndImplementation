#!/usr/bin/env python3
from peewee import *


db = SqliteDatabase('Students.db')

class Student(Model):
    username = CharField(max_length = 255, unique = True)
    points = IntegerField(default = 0)

    class Meta:
        database = db

if __name__ == "__main__":
		db.connect()
		db.create_tables([Student], safe = True)
