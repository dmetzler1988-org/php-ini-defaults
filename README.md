# PHP ini defaults

A reference collection of the default and unmodified `php.ini` files of every PHP minor version, from
PHP 1.0 up to PHP 8.5 (PHP 6 was never released).

Use it to look up which settings exist in a specific version and how their default values changed
over time. All files are exactly as they are shipped by PHP, nothing is edited by hand.

## Usage

### Via GitHub Actions (recommended)

Add the wanted PHP version to the `PHP_VERSIONS` list in `start.sh` and push it to `main`. The
[workflow](.github/workflows/update-php-ini.yml) then collects the `php.ini` files and commits them
back into the repository. It can also be started manually from the *Actions* tab
(*Update PHP ini defaults* → *Run workflow*).

This works only for versions with a usable docker image, which means PHP 5.6 and newer. A version
without a usable image is skipped with a message and its folder is kept untouched - see
[PHP versions](#php-versions).

### Locally

You simple need to download or clone this repository and execute `bash start.sh` in your terminal (make sure, that Docker is running before execution).

## PHP versions

One folder per minor version, and it always contains the files of the **latest patch release** of
this minor version - for example `5.3` contains the files of `php-5.3.29` and `4.3` the files of
`php-4.3.11`. For the docker based versions this happens automatically, because a tag like
`php:8.4-alpine` always points to the newest 8.4 release.

### PHP 5.6 and newer

These folders are collected automatically by `start.sh` out of the official PHP docker images
(`php:<version>-alpine`).

### PHP 5.5 and older

All these folders (PHP 1.0 up to PHP 5.5) were exported **manually** from the official PHP source
tarballs and are **not** touched by `start.sh`. All of these tarballs are available on
[museum.php.net](https://museum.php.net/), some of them also on
[www.php.net/distributions](https://www.php.net/distributions/) - where a tarball exists on both, the
archives are identical.

`start.sh` cannot be used for these versions:

* For PHP 5.2 and older there are **no** official docker images at all, the oldest one is PHP 5.3.
* The images of PHP 5.3 and PHP 5.4 use an old manifest format, docker cannot pull them anymore.
* The image of PHP 5.5 can be pulled, but does not contain the `php.ini` files. PHP 5.6 is the first
  image which contains them.

The file names are different in older versions:

| Version         | Files                                          |
|-----------------|------------------------------------------------|
| 3.0             | `php3.ini-dist`                                |
| 4.0             | `php.ini-dist`, `php.ini-optimized`            |
| 4.1 up to 5.2   | `php.ini-dist`, `php.ini-recommended`          |
| 5.3 and newer   | `php.ini-development`, `php.ini-production`    |

PHP 1.0 and PHP 2.0 are not in this table, they have no `php.ini` - see the next section.

### PHP 1 and PHP 2

The `php.ini` was introduced with PHP 3. These two versions were configured at compile time by
editing a C header before building PHP, so this header is saved instead:

| Version | File           | Taken from (only on museum.php.net) |
|---------|----------------|-------------------------------------|
| 1.0     | `php/config.h` | `php-108.tar.gz`, `php/config.h`    |
| 2.0     | `php/php.h`    | `php-2.0.1.tar.gz`, `src/php.h`     |

The syntax is C, not ini, and the settings of the two files have nothing in common:

* PHP 1.0: `ROOTDIR`, `HTML_DIR`, `LOGDIR`, `ACCDIR` and `NOACCESS`.
* PHP 2.0: `PHP_PUB_DIRNAME`, `PHP_ROOT_DIR`, `UPLOAD_TMPDIR`, `VIRTUAL_PATH`, `DEBUG_FILE` and
  `MAGIC_QUOTES` - the last one later became the `magic_quotes_gpc` setting in `php.ini`.

The PHP 2 header contains platform macros beside the settings, because there was no separate config
file. Its `config.h.in` is **not** saved here, it only contains the feature detection of `configure`
(`#undef HAVE_VPRINTF` and similar) and no settings.
