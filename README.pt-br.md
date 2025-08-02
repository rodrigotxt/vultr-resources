# Vultr API Resources

📄 Available in: 🇺🇸[English](README.md) | 🇧🇷[Português](README.pt-br.md)

Este repositório foi criado com o objetivo de centralizar e facilitar o acesso rápido aos principais recursos extraídos da **API do Vultr**. Ele serve como uma **fonte de referência** para obter rapidamente **IDs, nomes e dados** utilizados em automações e infraestrutura como código (**IaC**).

## 📚 Objetivo

Ao trabalhar com automação usando a API da Vultr, é comum precisar de informações como:
- IDs de regiões (location)
- Tipos de instâncias
- Sistemas operacionais disponíveis
- Tipos de plano
- Snapshots, ISOs, etc.

Este repositório organiza essas informações de forma legível e reutilizável, ajudando a economizar tempo durante o desenvolvimento.

## 🗂 Estrutura

Os dados estão organizados em **pastas nomeadas conforme os endpoints da API**, por exemplo:

/regions
/plans
/instances
/os
/sshkeys


Cada pasta contém arquivos `.json` com o retorno da API correspondente. Exemplo:

/regions/regions.json
/os/operating_systems.json


## 📦 Formato

Todos os arquivos estão no **formato JSON**, exatamente como retornados pela API do Vultr, facilitando o uso direto em scripts, templates e ferramentas de provisionamento.

## 🔁 Atualização

Os dados podem ser atualizados periodicamente conforme alterações na API da Vultr, garantindo que os recursos estejam sempre atualizados.

## 🛠 Uso Sugerido

Você pode usar este repositório para:
- Buscar rapidamente o ID de uma imagem, plano ou região
- Referenciar recursos em ferramentas como Terraform, Ansible ou scripts customizados
- Validar estrutura dos retornos da API