CONFIG = {
    'mode': 'wsgi',
    'working_dir': '/home/box/web/ask/ask',
    'args': (
        '--bind=0.0.0.0:800',
        '--workers=4',
        '--timeout=260',
        '--max-requests=500',
        'wsgi.py',
        '--debug',
        '--log-level=debug',
    ),
}
