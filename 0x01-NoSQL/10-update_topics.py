#!/usr/bin/env python3
"""
This modules has a function that changes all topics of
a school document based on name
"""


def update_topics(mongo_collections, name, topics):
    """Changes all topics of a school document based on name"""
    if mongo_collections is None:
        return None
    result = mongo_collections.update_many(
            {"name": name}, {'$set': {"topics": topics}})
    return result.modified_count
