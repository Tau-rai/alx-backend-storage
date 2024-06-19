#!/usr/bin/env python3
"""
Ths module contains a function that provides stats
about Nginx logs stored in MongoDB
"""


from pymongo import MongoClient


def log_stats():
    """Function that provides stats about Nginx logs stored in MongoDB"""
    client = MongoClient()
    db = client.logs
    collection = db.nginx

    total_logs = collection.count_documents({})

    print(f"{total_logs} logs")
    print("Methods:")

    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = collection.count_documents({"method": method})
        print(f"\tmethod {method}: {count}")

    count = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{count} status check")

    print("IPs:")
    ips = collection.aggregate([
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ])
    for ip in ips:
        print(f"\t{ip['_id']}: {ip['count']}")


if __name__ == "__main__":
    log_stats()
