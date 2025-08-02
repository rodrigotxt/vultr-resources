# Vultr API Resources

📄 Available in: 🇺🇸[English](README.md) | 🇧🇷[Português](README.pt-br.md)

This repository was created to centralize and simplify quick access to key resources extracted from the **Vultr API**. It serves as a **reference source** to easily find **IDs, names, and metadata** commonly used in automation and Infrastructure as Code (**IaC**) tools.

## 📚 Purpose

When working with Vultr's API, it's common to need:
- Region IDs
- Instance types
- Available operating systems
- Plan details
- Snapshots, ISOs, etc.

This repository organizes these responses in a readable and reusable format to save time during development and provisioning.

## 🗂 Structure

The data is organized into folder **data/namedEndpoint.json**, for example:

/data/regions.json

/data/plans.json

/data/os.json


## 📦 Format

All files are in **raw JSON format**, exactly as returned by Vultr's API. This makes them easy to use directly in scripts, templates, or IaC tools.

## 🔁 Updates

Data may be updated periodically to reflect changes in Vultr's API, ensuring that the references remain current. Official API documentation: https://www.vultr.com/api/

## 🛠 Suggested Use

You can use this repository to:
- Quickly look up IDs for images, plans, or regions
- Reference resources in tools like Terraform, Ansible, or shell scripts
- Validate API response structures

