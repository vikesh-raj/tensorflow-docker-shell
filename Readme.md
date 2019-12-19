

Commands to invoke docker shell with tensorflow installed.

Once inside the shell, you should be able to see the following message :

```
________                               _______________
___  __/__________________________________  ____/__  /________      __
__  /  _  _ \_  __ \_  ___/  __ \_  ___/_  /_   __  /_  __ \_ | /| / /
_  /   /  __/  / / /(__  )/ /_/ /  /   _  __/   _  / / /_/ /_ |/ |/ /
/_/    \___//_/ /_//____/ \____//_/    /_/      /_/  \____/____/|__/


You are running this container as user with ID 1000 and group 1000,
which should map to the ID and group for your user on the Docker host. Great!
```

The root folder is bind mounted to /app.
The files created here will belong to the correct user and you can edit it outside of the docker shell.


Commands available:

```
make docker-shell
```

