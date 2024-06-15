#!/usr/bin/env python3
"""This module contains a function that list all documents in a collection"""


def list_all(mongo_collection):
    """Returns a list of all documnets in a collection"""
    if mongo_collection is None:
        return []
    return list(mongo_collection.find())
