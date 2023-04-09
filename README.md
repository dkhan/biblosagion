# BIBLOS-AGION project proves the genuineness of the Bible as the Word of God

## Setup

1. Start PostreSQL server with `/usr/local/opt/postgresql@14/bin/postgres -D /usr/local/var/postgres` or run `brew services start postgresql@14` to start automatically.
2. Create a database user
```
createuser -s moses (default password `aaron`)
```
3. Start postgresql console
```
psql -U moses
```
4. create test and development databases
```
CREATE DATABASE biblos_dev
CREATE DATABASE biblest_test
```
5. Run the application in Rails console `bundle exec rails c development`.

## Running the specs

Use `rspec` to run the specs

## About

Biblos-Agion is named after the first and the last New Testament words in original Greek: Biblos (Book) and Agion (Holy).  The project proves that the Bible is signed by God by mathematical patterns first discovered by Harvard professor Dr. Ivan Panin, 'the father of Bible numerics'.

## Credits for data sources

* "Tyndale House, Cambridge":  www.TyndaleHouse.com
* "STEP Bible" project: www.STEPBible.org
* Source files downloads: https://tyndale.github.io/STEPBible-Data/
