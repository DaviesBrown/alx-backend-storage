#!/usr/bin/env python3
"""
log stats
"""
import pymongo as pm
from pymongo.collection import Collection

method = ["GET", "POST", "PUT", "PATCH", "DELETE"]


def status_code_count(mongo_collection: Collection, method="") -> int:
    if method:
        return mongo_collection.count_documents({'method': method})
    else:
        return mongo_collection.count_documents({})


def main() -> None:
    client = pm.MongoClient('mongodb://127.0.0.1:27017')
    m_collection = client.logs.nginx
    doc_count = status_code_count(m_collection)
    print(f'{doc_count} logs')
    print('Methods:')
    for m in method:
        print(f'\tmethod {m}: {status_code_count(m_collection, m)}')
    get_status = m_collection.count_documents({
        'method': 'GET',
        'path': '/status'
    })
    print(f'{get_status} status check')


if __name__ == '__main__':
    main()
