#!/usr/bin/env python3
'''
Module for Implementing an expiring web cache and tracker
'''
from typing import Callable
import requests
import redis
from functools import wraps

redis_client = redis.Redis()


def cache_result(expiration: int=10) -> Callable:
    '''Caches the output of fetched data.
    '''
    def decorator(func: Callable) -> Callable:
        """cache decorator"""
        @wraps(func)
        def wrapper(url: str) -> str:
            '''The wrapper function for caching the output.
            '''
            cache_key = f"cache:{url}"
            cached_result = redis_client.get(cache_key)
            if cached_result:
                redis_client.incr(f"count:{cache_key}")
                return cached_result.decode('utf-8')
            result = func(url)
            redis_client.setex(cache_key, expiration, result)
            redis_client.set(f"count:{cache_key}", 1)
            return result
        return wrapper
    return decorator


@cache_result(expiration=10)
def get_page(url: str) -> str:
    '''
    Returns the content of a URL after caching the request's
    response, and tracking the request.
    '''
    response = requests.get(url)
    return response.text
