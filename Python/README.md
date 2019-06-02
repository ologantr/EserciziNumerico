# Calcolo numerico

## Before you start

### virtualenv

You should run this inside a virtualenv.

To create a new virtualenv run:

```
python3 -m venv env
```

This will create a new directory `env` containing your Python environment.
You have to run this only once.

Activate the virtualenv with:

```
source env/bin/activate
```

This will have effect only in the current shell and you need to run it everytime
you want to upgrade or run this.

## Development

Make sure to be inside the virtualenv and run:

```
python3 setup.py develop
```

### Emacs

Run:

```
M-x pyvenv-activate
```

And provide the path to your virtualenv directory.

This is like running `source env/bin/activate` from the shell.

Then run:

```
M-x python-run-or-switch-to-repl
```

### Running tests

Run:

```
python3 setup.py test
```

Please make sure all tests are running before publishing your commits.

### Linter

Run:

```
python3 setup.py flake8
```

Please make sure the linter doesn't complain before publishing your commits.
