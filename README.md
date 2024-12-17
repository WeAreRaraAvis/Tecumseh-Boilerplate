# Tecumseh Craft CMS Boilerplate

The **Tecumseh Craft CMS Boilerplate** is a development setup that spins up an instance of [Craft CMS](https://craftcms.com) in **GitHub Codespaces**. It is designed to be compatible with [Servd](https://servd.host/) for seamless deployment and hosting.

This boilerplate includes:
- **Bash scripts** for automating development workflows.
- **Cypress** integration for quality assurance testing.
- **Webpack** for JavaScript bundling.
- **Tailwind CSS** compilation.
- A database management workflow for synchronization with Servd.

---

## Getting Started

### 1. Login Credentials
As a first step, **change the login credentials** within the Craft CMS control panel relative to the project you're working on.

---

### 2. Servd Configuration
1. Configure your project in your **Servd account** to match the boilerplate setup.
2. Once you've pushed your changes to your repository, you must **export your database** and **import/sync it** in Servd's control panel.

> **Note**: If you skip the database sync step, your project URL will display an error claiming that **Craft CMS is not installed**.

---

### 3. Running the Boilerplate in GitHub Codespaces

After creating a new Codespace, Tecumseh will spin up a Craft CMS instance automatically.

- The Craft CMS website homepage can be found at:  
  **[https://${CODESPACE_NAME}-8080.app.github.dev/](https://${CODESPACE_NAME}-8080.app.github.dev/)**

---

## Scripts and Aliases

The following aliases and scripts are available to streamline your workflow:

activate - Activates the environment by executing a post-build script located in the .devcontainer directory.  
cypress - Runs a quality assurance script for Cypress from the .devcontainer directory.  
package - Executes the webpack command through npx to bundle JavaScript applications and compiles Tailwind CSS.  
finalize - Exports the database without compression to a file named latest.sql in the .db-dumps directory.  
