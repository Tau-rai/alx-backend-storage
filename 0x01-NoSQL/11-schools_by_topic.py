#!/usr/bin/env python3
"""This module has a function that returns a list of school and their topics"""


def schools_by_topic(mongo_collection, topic):
    """This function returns a list of school with a specif topic"""
    return mongo_collection.find({"topics": topic})
