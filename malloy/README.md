# Malloy Exploration for the Airbnb dbt Project

This folder contains [Malloy](https://malloydata.github.io/) models that query the
Snowflake tables already built by the `airbnb_new` dbt project. Malloy is a
semantic/query layer that compiles to SQL — it does **not** replace dbt, it sits
alongside it for exploration and analysis.

## Prerequisites

1. Install the **Malloy** extension for VS Code (publisher: `malloy-lang`,
   extension id `malloydata.malloy-vscode`).
2. Make sure the dbt project in `../airbnb_new` has been run at least once so the
   following tables exist in Snowflake:
   - `AIRBNB_NEW.DEV.SRC_HOSTS`
   - `AIRBNB_NEW.DEV.SRC_LISTINGS`
   - `AIRBNB_NEW.DEV.SRC_REVIEWS`
   - `AIRBNB_NEW.DEV.FCT_REVIEWS`
   - `AIRBNB_NEW.DEV.DIM_HOSTS_CLEANSED` (if you've built it)
   - `AIRBNB_NEW.DEV.DIM_LISTINGS_CLEANSED` (if you've built it)

## Connecting to Snowflake

Malloy's Snowflake connector reads connection details from the VS Code extension's
connection manager (Command Palette → "Malloy: Edit Connections"), **not** from
`profiles.yml`. When prompted, configure a connection named `snowflake` with:

| Field          | Value                                   |
|----------------|------------------------------------------|
| Account        | `BGMVEYD-QY96488`                        |
| Username       | `dbt_new`                                 |
| Role           | `TRANSFORM`                               |
| Warehouse      | `COMPUTE_WH_NEW`                          |
| Database       | `AIRBNB_NEW`                              |
| Schema         | `DEV`                                     |
| Authentication | Key-pair (use the same private key used by dbt, or a password/SSO if you prefer a separate Malloy-only user) |

> You can reuse the same Snowflake user as dbt, or create a read-only user
> (e.g. a `REPORTER`-role service account) dedicated to Malloy exploration.

## Files

- `airbnb.malloy` — core source definitions (`hosts`, `listings`, `reviews`) built
  directly on top of the dbt-built tables, plus a few example queries.
- `fct_reviews.malloy` — source definition + exploratory queries against the
  incremental `fct_reviews` fact table.

## Running Queries

Open any `.malloy` file in VS Code with the Malloy extension installed, then use
the "Run" code-lens above a `query:` block (or select a query and run it via the
command palette).
