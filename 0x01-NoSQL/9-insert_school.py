#!/usr/bin/env python3
"""
insert a collection of kwargs
"""
from pymongo.collection import Collection


def insert_school(mongo_collection: Collection, **kwargs):
    """
    inserts a new document in a collection
    based on kwargs
    """
    x = mongo_collection.insert_one(kwargs)
    return x.inserted_id
