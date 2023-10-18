#!/usr/bin/env python3
"""
update topics
"""
from typing import List
from pymongo.collection import Collection


def update_topics(mongo_collection: Collection, name: str, topics: List[str]):
    """
    changes all topics of a school document
    based on the name
    """
    mongo_collection.update_one(
        {"name": name},
        {"$set": {"topics": topics}}
        )
