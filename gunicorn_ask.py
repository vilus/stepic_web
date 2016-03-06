CONFIG = {
    'mode': 'wsgi',
    'working_dir': '/home/box/web/ask',
    'args': (
        '--bind=0.0.0.0:8000',
        '--workers=4',
        '--timeout=260',
        '--max-requests=500',
        'ask.wsgi',
        '--debug',
        '--log-level=debug',
    ),
}
