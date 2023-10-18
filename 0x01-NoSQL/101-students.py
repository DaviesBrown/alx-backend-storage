#!/usr/bin/env python3
"""
student by avg score
"""
from pymongo.collection import Collection


def top_students(mongo_collection: Collection):
    """
    returns all students by average score
    """
    new = mongo_collection.aggregate([
        {"$unwind": '$topics'},
        {"$group": {
            "_id": "$_id",
            "name": {"$first": "$name"},
            "averageScore": {"$avg": "$topics.score"}
            }
        },
        {"$sort": {"averageScore": -1}}
    ])
    return new
