#!/usr/bin/env python3
"""
This module has a function that returns a list of all students
sorted by average score
"""


def top_students(mongo_collection):
    """Returns a list of all students sorted by average score"""
    return mongo_collection.aggregate([
        {"$project": {
            "name": "$name",
            "averageScore": {"$avg": "$topics.score"}
        }},
        {"$sort": {"averageScore": -1}}
    ])
