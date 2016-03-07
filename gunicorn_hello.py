CONFIG = {
    'mode': 'wsgi',
    'working_dir': '/home/bow/web',
    'args': (
        '--bind=127.0.0.1:8080',
        '--workers=4',
        '--timeout=260',
        '--max-requests=500',
        'hello',
        '--debug',
        '--log-level=debug',
    ),
}
