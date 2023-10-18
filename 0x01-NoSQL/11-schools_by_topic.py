#!/usr/bin/env python3
"""
list all school
"""
from pymongo.collection import Collection


def schools_by_topic(mongo_collection: Collection, topic: str):
    """
    list all school by a specific topic
    """
    return list(mongo_collection.find({"topics": {"$in": [topic]}}))
