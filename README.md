# README

This is a little tool to get informations from docker container.

In this special tool all default and unedited `PHP.ini` files will be collected and saved to make a backup.

## Usage

### Via GitHub Actions (recommended)

Add the wanted PHP version to the `PHP_VERSIONS` list in `start.sh` and push it to `main`. The
[workflow](.github/workflows/update-php-ini.yml) then collects the `php.ini` files and commits them
back into the repository. It can also be started manually from the *Actions* tab
(*Update PHP ini defaults* → *Run workflow*).

### Locally

You simple need to download or clone this repository and execute `bash start.sh` in your terminal (make sure, that Docker is running before execution).
