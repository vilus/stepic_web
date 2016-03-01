CONFIG = {
    'mode': 'wsgi',
    'working_dir': '.',
    'args': (
        '--bind=127.0.0.1:8080',
        '--workers=4',
        '--timeout=260',
        '--max-requests=500',
        'hello.py',
        '--debug',
        '--log-level=debug',
    ),
}
