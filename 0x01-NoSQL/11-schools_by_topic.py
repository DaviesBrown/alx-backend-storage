#!/usr/bin/env python3
"""
list all school
"""


def schools_by_topic(mongo_collection, topic):
    """
    list all school by a specific topic
    """
    return list(mongo_collection.find({"topics": {"$in": [topic]}}))
