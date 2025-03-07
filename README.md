# Biblos-Agion

Biblos-Agion is a Ruby on Rails application that demonstrates the divine inspiration of the Bible by revealing hidden mathematical patterns in its text. These patterns, first discovered by Harvard professor Dr. Ivan Panin (often regarded as the father of Bible numerics), are presented as evidence of the Bible’s sacred origin.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Setup](#setup)
- [Usage](#usage)
- [Testing](#testing)
- [Data Sources](#data-sources)
- [Contributing](#contributing)
- [License](#license)

## Overview

Biblos-Agion analyzes biblical texts using numerical techniques to uncover patterns that support the notion of divine authorship. The project’s name is inspired by the Greek words “Biblos” (Book) and “Agion” (Holy), which are respectively the first and last words of the original Greek manuscripts.

## Features

- **Bible Numerics Analysis:** Explore mathematical patterns hidden within biblical texts.
- **Reliable Data Integration:** Uses verified data from established sources.
- **Interactive Console:** Work with the data interactively using the Rails console.
- **Automated Testing:** Comprehensive tests using RSpec ensure the integrity of the analysis.

## Setup

Follow these steps to install and run Biblos-Agion on your local machine:

1. **Start PostgreSQL Server**

   If you’re using Homebrew, start the PostgreSQL server by running:
   ```bash
   /usr/local/opt/postgresql@14/bin/postgres -D /usr/local/var/postgres
   ```
   Alternatively, start it as a background service:
   ```bash
   brew services start postgresql@14
   ```

2. **Create a Database User**

   Create a new PostgreSQL user (e.g., `moses`) with superuser privileges:
   ```bash
   createuser -s -P moses
   ```
   When prompted, use the default password `aaron`.

4. **Create Development and Test Databases**

   To create the databases, execute:
   ```bash
   createdb biblos_dev -U moses
   createdb biblos_test -U moses
   ```

5. **Populate the Database**

   Load the Bible datasets into the database:
   ```bash
   bundle exec rake dataset:populate
   ```

6. **Launch the Rails Console**

   Start the Rails console in the development environment:
   ```bash
   bundle exec rails console development
   ```

## Usage

Once the setup is complete, you can use the Rails console to interact with the application. Explore the biblical numerics data, run custom queries, or analyze the mathematical patterns to see the evidence of divine signature in the Bible.

## Testing

To run the test suite and ensure everything is functioning as expected, execute:
```bash
rspec
```
This will run all RSpec tests and report on the integrity of the application's features.

## Data Sources

The project uses high-quality data from reputable sources:
- **Tyndale House, Cambridge:** [TyndaleHouse.com](https://www.TyndaleHouse.com)
- **STEP Bible Project:** [STEPBible.org](https://www.STEPBible.org)
- **STEP Bible Data Downloads:** [STEPBible-Data](https://tyndale.github.io/STEPBible-Data/)

## Contributing

Contributions are welcome! If you have improvements or bug fixes, please follow these steps:
1. **Fork the Repository:** Create your own copy of the project.
2. **Create a New Branch:** Develop your feature or fix in a separate branch.
3. **Write Tests:** Ensure that any new changes are covered by tests.
4. **Submit a Pull Request:** Provide a clear description of your changes.

## License

[MIT License](LICENSE)
