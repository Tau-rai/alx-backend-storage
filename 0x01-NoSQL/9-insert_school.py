#!/usr/bin/env python3
"""This module has a function that inserts a new document in a collection"""


def insert_school(mongo_collection, **kwargs):
    """Returns a new id"""
    if not kwargs:
        return None
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
