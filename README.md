# Geronimo
>A home network speed and latency monitor.

Geronimo gives you the ability to execute ad-hoc and scheduled network bandwidth tests to view the real-time and historical speed and latency of your network(s).

## Installation
From Docker Hub:
```
docker pull caseyschmitz0/geronimo:latest
```

From source:
```
git clone https://github.com/caseyschmitz/geronimo.git --recurse-submodules
```

## Configuration
Copy `.env.example.dev` and `.env.example.db`; rename them to `.env.dev` and `.env.db`, respectively.

[Django recommends](https://docs.djangoproject.com/en/3.1/ref/settings/#secret-key) that you configure a *SECRET_KEY* for cryptographic signing. A key can be generated with the following command:
```
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```

## Getting Started
1. Run the application with `docker-compose`:
    ```
    docker-compose up -d
    ```
    *Note:* System logs can be followed with `docker-compose logs -f`.

2. Apply database migrations to active db container:
    ```
    docker-compose run api bash
    python manage.py migrate
    ```

3. Create a super-user for the application by running the following code in the active api container:
    ```
    docker-compose run api bash
    python manage.py createsuperuser --username <user> --email <email>
    ```

4. By default, the application runs locally - navigate to http://localhost/geronimo in a web browser and login as the super-user created in step #3 to start executing ad-hoc and scheduled speedtests.


### Troubleshooting
If you're having trouble starting Docker due to `permission denied` errors, try adding your user account to the docker group. Explained [here](https://linuxhandbook.com/docker-permission-denied/#fix-2-running-docker-commands-without-sudo).

If you are running Docker on Windows with WSL2, ensure your system is [properly configured](https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2).

## License

MIT License

Copyright (c) 2020 Casey Schmitz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
