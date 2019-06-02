from setuptools import setup, find_packages

setup(
    name='calcolo-numerico',
    version='0.0.1',
    description='',

    author='',
    author_email='',

    license='',
    url='',

    setup_requires=["pytest-runner==4.4", "flake8==3.7.7"],
    install_requires=["matplotlib==3.1.0"],
    tests_require=["pytest==4.5.0"],

    packages=find_packages()
)
