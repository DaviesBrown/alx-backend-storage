#!/usr/bin/env python3
"""
list all document
"""


def list_all(mongo_collection):
    """
    returns the cursor to all document in
    a collection
    """
    col = mongo_collection.count_documents({})
    if col == 0:
        return []
    return mongo_collection.find()
